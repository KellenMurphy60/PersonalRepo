#include <stdio.h>
#include <stdlib.h>

// Structure to hold grayscale pixel data
typedef struct {
    unsigned char value;
} PixelGray;

// Function to read a PGM image into a 2D array
PixelGray** readPGM(const char* filename, int* width, int* height) {
    char trashbuff[3];
    int rows;
    int cols;
    int maxPixel;
    int *pixelValue;
    width = &cols;
    height = &rows;
    pixelValue = &maxPixel;
    PixelGray* numBuff;
    char* buff[1] = {"0"};

    FILE *picture_in = NULL; //input file
    picture_in = fopen("lenna.pgm", "rb");

    fscanf(picture_in,"%s", trashbuff);
    fscanf(picture_in,"%d %d %d",width,height, pixelValue);
    cols = *height;
    if (*height != 512)
    {
        printf("Image size extracted incorrectly");
    }
    PixelGray **matrix = (PixelGray **)malloc(*height * sizeof(char)); //begin allocating the 2D matrix
    if (matrix == NULL) {
        printf("ErrorREAD: Unable to allocate memory for rows in \n");
        return NULL;
    }
// Allocate memory for each row (array of integers)
    for (int i = 0; i < rows; i++) {
        matrix[i] = (PixelGray *)malloc(*width * sizeof(char));
        if (matrix[i] == NULL) {
            printf("ErrorREAD: Unable to allocate memory for columns in row %d\n", i);
            return NULL;
        }
    }
// Initialize and use the 2D array
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            fread(buff,sizeof(char),1,picture_in); //read 1 unsigned char value
            matrix[i][j].value = *buff[0]; //store that unsigned char value in the corresponding array index
        }
    }

    fclose(picture_in);
    return matrix;
    }
// Function to write a 2D matrix as a PGM image
void writePGM(const char* filename, PixelGray** matrix, int* width, int* height){

FILE *fptr;
fptr = fopen(filename,"w");
if (fptr == NULL) //if the file fails to open it will return an error.
    {
        printf("%s", "cannot open file");
    }
fprintf(fptr, "P5\n"); //magic number followed by newline
    fprintf(fptr, "%d %d\n", *width, *height); //image dimensions
fprintf(fptr, "255\n"); //max pixel value
    for (int i = 0; i < *height; i++) {
        fwrite(matrix[i], 1, *width, fptr); //writes *width* number of char values to matrix[i]
        fprintf(fptr, "\n");
    }
}

// Function to threshold the image matrix
PixelGray** threshold(PixelGray** matrix, int* width, int* height){
    PixelGray **Threshmatrix = (PixelGray **)malloc(*height * sizeof(char *)); //new matrix to be returned
    // Allocate memory for each row (array of integers)

    for (int i = 0; i < *height; i++) {
        Threshmatrix[i] = (PixelGray *)malloc(*width * sizeof(char));
        if (Threshmatrix[i] == NULL) {
            printf("ErrorTHRESH: Unable to allocate memory for columns in row %d\n", i);
            return NULL;
        }
    }
//use the 2D array
    for (int i = 0; i < *height; i++) {
        for (int j = 0; j < *width; j++) {
            if((matrix[i][j].value >= 80))
            {
                Threshmatrix[i][j].value = 255;
            }
            else
            {Threshmatrix[i][j].value = 0;}
        }
    }
    return Threshmatrix;
}

// Function to rotate the image matrix
PixelGray** rotate(PixelGray** matrix, int* width, int* height){

    PixelGray **Rotatematrix = (PixelGray **)malloc(*height * sizeof(char *)); //new matrix to be returned
    // Allocate memory for each row (array of integers)

    for (int i = 0; i < *height; i++) {
        Rotatematrix[i] = (PixelGray *)malloc(*width * sizeof(char));
        if (Rotatematrix[i] == NULL) {
            printf("ErrorROTATE: Unable to allocate memory for columns in row %d\n", i);
            return NULL;
        }
    }

    for (int i = 0; i < *height; i++) {
        for (int j = 0; j < *width; j++) {
            Rotatematrix[i][j] = matrix[j][i];
        }
    }
    return Rotatematrix;
}
//main function - DO NOT MODIFY
int main() {
    int width, height;  // variable to hold width and height. Use reference in other functions

    PixelGray** image_original = readPGM("lenna.pgm", &width, &height);
    // Now you have the grayscale image data in the 'image_original' 2D array


    // Access pixel data using image[row][col].value
    // For example, to access the pixel at row=2, col=3:
    // unsigned char pixel_value = image[2][3].value;

    // Create a new 2D array 'image_thresh' to store the threshold image
    PixelGray** image_thresh = threshold(image_original, &width, &height);
    //write the image data as "threshold.pgm"
    writePGM("threshold.pgm", image_thresh, &width, &height);

    // Create a new 2D array 'image_rotate' to store the rotated image
    PixelGray** image_rotate = rotate(image_original, &width, &height);
    //write the image data as "rotate.pgm"
    writePGM("rotate.pgm", image_rotate, &width, &height);

    image_rotate = rotate(image_rotate, &width, &height);
    //write the image data as "rotate_again.pgm"
    writePGM("rotate_again.pgm", image_rotate, &width, &height);

    // Free the allocated memory when you're done
    for (int i = 0; i < height; ++i) {
        free(image_original[i]);
        free(image_thresh[i]);
        free(image_rotate[i]);
    }
    free(image_original);
    free(image_thresh);
    free(image_rotate);
    return 0;

}