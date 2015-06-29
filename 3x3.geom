*version
1.0
*title
3x3 square grid
*dimensions
16	# number of nodes
2	# number of spatial dimensions
1	# number of element sets
#  [ID]  [nel]  [nen]
1  9  4
4  # number of node sets
#  [ID]  [nnd]
1	4
2	4
3	4
4	4
0  # number of side sets
# end dimensions
*nodesets
*set
4  # number of nodes
1  5  9  13  
*set
4  # number of nodes
13  14  15  16  
*set
4  # number of nodes
4  8  12  16  
*set
4  # number of nodes
1  2  3  4  
# end node sets
*sidesets
*elements
*set
9  # number of elements
4   # number of element nodes
	1	1	5	6	2
	2	5	9	10	6
	3	9	13	14	10
	4	2	6	7	3
	5	6	10	11	7
	6	10	14	15	11
	7	3	7	8	4
	8	7	11	12	8
	9	11	15	16	12
# end elements
*nodes
16  # number of nodes
2   # number of spatial dimensions
	1	-5.000000e-01	-5.000000e-01
	2	-5.000000e-01	-1.666667e-01
	3	-5.000000e-01	1.666667e-01
	4	-5.000000e-01	5.000000e-01
	5	-1.666667e-01	-5.000000e-01
	6	-1.666667e-01	-1.666667e-01
	7	-1.666667e-01	1.666667e-01
	8	-1.666667e-01	5.000000e-01
	9	1.666667e-01	-5.000000e-01
	10	1.666667e-01	-1.666667e-01
	11	1.666667e-01	1.666667e-01
	12	1.666667e-01	5.000000e-01
	13	5.000000e-01	-5.000000e-01
	14	5.000000e-01	-1.666667e-01
	15	5.000000e-01	1.666667e-01
	16	5.000000e-01	5.000000e-01
