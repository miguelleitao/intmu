
/* Copyright (c) Instituto Superior de Engenharia do Porto 2000. */

/*
 *  moinho.c
 * 
 */
 
#include <stdlib.h>
#include <GL/freeglut.h>
#include <stdio.h>
#include <sys/stat.h>
 

int timenow;

void InitView()
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(30, 1.0, 0.1, 200.0);
    gluLookAt(0., -15., 5., 0., 1., 1., 0. ,1. ,0.); 
}

void Init (void)
{
    InitView();

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glDepthFunc(GL_LESS);  
    glEnable(GL_DEPTH_TEST);
    
    glClearColor(0.1, 0.1, 0.5, 1.);
    
}


void     moinho()
{
    glPushMatrix();

    glPopMatrix();
}

void Display (void)
{    
    glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    timenow=glutGet(GLUT_ELAPSED_TIME); // Tempo em milisegundos
	
    moinho();

    glFlush ();    
}

void Reshape(int w, int h)
{
    InitView();
    glViewport (0, 0, w, h);
}

static void
Key(unsigned char k, int x, int y)
{
  switch (k)
  {
    case 27:  /* Escape */
      exit(0);
      break;
    default:
      return;
  }
  glutPostRedisplay();
}



int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode ( GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize (500, 500);
    glutCreateWindow (argv[0]);
    Init();
    glutReshapeFunc(Reshape);
    glutDisplayFunc(Display);
    glutKeyboardFunc(Key);
    glutMainLoop();
    return 0;           
}
