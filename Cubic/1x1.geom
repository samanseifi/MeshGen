*version
1.0
*title
1x1 square grid
*dimensions
4	# number of nodes
2	# number of spatial dimensions
1	# number of element sets
#  [ID]  [nel]  [nen]
1  1  4
4  # number of node sets
#  [ID]  [nnd]
1	2
2	2
3	2
4	2
0  # number of side sets
# end dimensions
*nodesets
*set
2  # number of nodes
1  3  
*set
2  # number of nodes
3  4  
*set
2  # number of nodes
2  4  
*set
2  # number of nodes
1  2  
# end node sets
*sidesets
*elements
*set
1  # number of elements
4   # number of element nodes
	1	1	3	4	2
# end elements
*nodes
4  # number of nodes
2   # number of spatial dimensions
	1	-5.000000e-01	-5.000000e-01
	2	-5.000000e-01	5.000000e-01
	3	5.000000e-01	-5.000000e-01
	4	5.000000e-01	5.000000e-01
