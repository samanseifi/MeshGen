% This code will create a rectangle element with n*m quadrilateral mesh for
% Tahoe input gemoetry (the format file is Tahoe I or II)
% by Saman Seifi (April 2015) last update: (Jan 2016)
clc
close all
clear all

% Length of the rectangle HxL
L = input('Length: ');  % x-direction
H = input('Height: ');  % y-direction

% Get the mesh size
meshsize = input('mesh size: ');

n = L/meshsize;
m = H/meshsize;

num_nodes = (n + 1)*(m + 1);
num_elem = (n)*(m);
num_sd = 2;

for i = 1:(n+1)
    for j = 1:(m+1)
        node_num(i, j) = j + (m + 1)*(i - 1);
        node_y(i, j) = -L/2 + (i - 1)*(L/n);
        node_x(i, j) = -H/2 + (j - 1)*(H/m);
    end
end

for i = 1:n
    for j = 1:m
        A{i,j} = node_num(i:i+1, j:j+1);
    end
end

filename = sprintf('%dx%d.geom', n ,m);
fid = fopen(filename, 'w');

fprintf(fid, '*version\n');
fprintf(fid, '1.0\n');
fprintf(fid, '*title\n');
fprintf(fid, '%dx%d square grid\n', n, m);
fprintf(fid, '*dimensions\n');
fprintf(fid, '%d\t# number of nodes\n', (n+1)*(m+1));
fprintf(fid, '2\t# number of spatial dimensions\n');
fprintf(fid, '1\t# number of element sets\n');
fprintf(fid, '#  [ID]  [nel]  [nen]\n');
fprintf(fid, '1  %d  4\n', n*m);
fprintf(fid, '4  # number of node sets\n');  % 4 node ID sets is choosen as default
fprintf(fid, '#  [ID]  [nnd]\n');
fprintf(fid, '%d\t%d\n', 1, n + 1);
fprintf(fid, '%d\t%d\n', 2, m + 1);
fprintf(fid, '%d\t%d\n', 3, n + 1);
fprintf(fid, '%d\t%d\n', 4, m + 1);

fprintf(fid, '3  # number of side sets\n');  % for now left and right
fprintf(fid, '# [ID]  [associate block ID]  [ns]\n');
fprintf(fid, '2  # number of side sets\n');  % for now left and right
fprintf(fid, '#  [ID]  [associate block ID]  [ns]\n');
fprintf(fid, '%d\t%d\t%d\n', 1, 1, m);
fprintf(fid, '%d\t%d\t%d\n', 2, 1, m);
fprintf(fid, '%d\t%d\t%d\n', 3, 1, n);
fprintf(fid, '# end dimensions\n');
fprintf(fid, '*nodesets\n');
fprintf(fid, '*set\n');

% Left side
fprintf(fid, '%d  # number of nodes\n', n + 1);
for i = 1:(n+1)
    fprintf(fid, '%d  ', 1 + (i - 1)*(m + 1)); 
end
fprintf(fid, '\n');
fprintf(fid, '*set\n');

% Top side
fprintf(fid, '%d  # number of nodes\n', m + 1);
for i = 1:(m+1)
    fprintf(fid, '%d  ', (m + 1)*n  + i); 
end
fprintf(fid, '\n');
fprintf(fid, '*set\n');

% Right side
fprintf(fid, '%d  # number of nodes\n', n + 1);
for i = 1:(n+1)
    fprintf(fid, '%d  ', i*(m + 1));
end
fprintf(fid, '\n');
fprintf(fid, '*set\n');

% Bottom side
fprintf(fid, '%d  # number of nodes\n', m + 1);
for i = 1:(m+1)
    fprintf(fid, '%d  ', i);
end
fprintf(fid, '\n');
fprintf(fid, '# end node sets\n');

% Defining the side sets for passivation usage
fprintf(fid, '*sidesets\n');
fprintf(fid, '*set\n');
fprintf(fid, '%d\n', m);
for j = 1:m
    fprintf(fid, '%d\t4\n', 1 + n*(j - 1)); % Left side (face side number = 4)
end
fprintf(fid, '*set\n');
fprintf(fid, '%d\n', m);
for j = 1:m
    fprintf(fid, '%d\t2\n', n + n*(j - 1)); % Right side (face side number = 2)
end  
fprintf(fid, '*set\n');
fprintf(fid, '%d\n', n);
for j = 1:n
    fprintf(fid, '%d\t1\n', 1 + n*(m - 1) + (j - 1));
end

% Elements
fprintf(fid, '*elements\n');
fprintf(fid, '*set\n');
fprintf(fid, '%d  # number of elements\n', n*m);
fprintf(fid, '4   # number of element nodes\n');

B = reshape(A, 1 ,n*m);
for k = 1:n*m
    B{k} = [A{k}(1,1) A{k}(2,1) A{k}(2,2) A{k}(1,2)] ;
    fprintf(fid, '\t%d', k);
    for l = 1:4
       fprintf(fid, '\t%d', B{k}(l)'); 
    end
    fprintf(fid, '\n');
end

fprintf(fid, '# end elements\n');
fprintf(fid, '*nodes\n');
fprintf(fid, '%d  # number of nodes\n', (n+1)*(m+1));
fprintf(fid, '2   # number of spatial dimensions\n');

Xs = reshape(node_x', 1, (m+1)*(n+1));
Ys = reshape(node_y', 1, (m+1)*(n+1));

for k = 1:(m+1)*(n+1)
    fprintf(fid, '\t%d', k);
    fprintf(fid, '\t%d', Ys(k));
    fprintf(fid, '\t%d', Xs(k));
    fprintf(fid, '\n');
end

fclose(fid);
