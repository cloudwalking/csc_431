/* Pascal Triangle */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
	int row;
	int column;
	int num_cols;
	int answer;
	int *left_col;
	int *right_col;
	int **matrix;
	
	int x;
	int y;
	int n;

	if(argc != 4) {
		printf("usage: triangle x y n\n");
		exit(-1);
	}
	
	x = (int)strtol(argv[1], NULL, 10);
	y = (int)strtol(argv[2], NULL, 10);
	n = (int)strtol(argv[3], NULL, 10);

	matrix = (int **)malloc(sizeof(int) * n);
	if(NULL == matrix) {
		perror("matrix malloc");
	}
		
	/* build triangle 
	 0 -> n = n+1 rows (triangle is zero based, remember?)*/
	for(row = 0; row <= n; row++) {
		/* normal case */
		if(row > 0) {
			
		} else {
			/* special case: row 0 */
		}
		
		/* build across */
		num_cols = row+1;
		matrix[row] = (int *)malloc(sizeof(int) * num_cols);
		for(column = 0; column < num_cols; column++) {
			if(column == 0) {
				/* left side */
				matrix[row][column] = 1;
			} else if(column == num_cols-1) {
				/* right side */
				matrix[row][column] = 1;
			} else {
				/* inside */
				left_col = &matrix[row-1][column-1];
				right_col = &matrix[row-1][column];
				matrix[row][column] = *left_col + *right_col;
			}
			printf("%d ", matrix[row][column]);
		}
		
		printf("\n");
	}
	
	answer = 0;
	row = n;
	for(column = 0; column <= row; column++) {
		answer += matrix[row-1][column] * (pow(x, n-column) + pow(y, column));
		/* printf("%d[%d^%d, %d^%d]+", matrix[row-1][column], x, n-column, y, column); */
	}
	
	/* printf("\n%d\n", answer); */

	return 0;
}
