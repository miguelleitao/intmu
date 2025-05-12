
IMG=grid
MAGICK=magick

all: ex2 ex6.2

ex2: ex2.1 ex2.2 ex2.3 ex2.4

ex2.1: ${IMG}_800t1.tiff ${IMG}_960t1.tiff
	identify $<
ex2.2: ${IMG}_800t2.tiff ${IMG}_960t2.tiff
	identify $<
ex2.3: ${IMG}_800t3.tiff ${IMG}_960t3.tiff
	identify $<
ex2.4: ${IMG}_800t4.tiff ${IMG}_960t4.tiff
	identify $<

${IMG}_800t1.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 800x600 $@

${IMG}_960t1.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 960x540 $@

${IMG}_800t2.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 800x600! $@

${IMG}_960t2.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 960x540! $@

${IMG}_800t3.tiff: ${IMG}.tiff
	${MAGICK} $< -resize x600 -gravity center -extent 800x600 $@

${IMG}_960t3.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 960 -gravity center -extent 960x540 $@

${IMG}_800t4.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 800x600 -background black -gravity center -extent 800x600 $@

${IMG}_960t4.tiff: ${IMG}.tiff
	${MAGICK} $< -resize 960x540 -background black -gravity center -extent 960x540 $@

ex4: ${IMG}.tiff
	convert ${IMG}.tiff -separate ${IMG}_RGB_%d.tga
	@display -resize 50% grid_RGB_0.tga &
	@display -resize 50% grid_RGB_1.tga &
	@display -resize 50% grid_RGB_2.tga &

ex5: ex5.1 ex5.2 ex5.3 ex5.4

ex5.1: ${IMG}.tiff
	convert ${IMG}.tiff -colorspace CMYK -separate ${IMG}_CMYK_%d.tga
	@display -resize 50% grid_CMYK_0.tga &
	@display -resize 50% grid_CMYK_1.tga &
	@display -resize 50% grid_CMYK_2.tga &
	@display -resize 50% grid_CMYK_3.tga &

ex5.2: ${IMG}.tiff
	convert ${IMG}.tiff -colorspace HSL -separate ${IMG}_HSL_%d.tga
	@display -resize 50% grid_HSL_0.tga &
	@display -resize 50% grid_HSL_1.tga &
	@display -resize 50% grid_HSL_3.tga &


ex5.3: ${IMG}.tiff
	convert ${IMG}.tiff -colorspace HSB -separate ${IMG}_HSB_%d.tga
	@display -resize 50% grid_HSB.tga &
	@display -resize 50% grid_HSB.tga &
	@display -resize 50% grid_HSB.tga &

ex5.4: ${IMG}.tiff
	convert ${IMG}.tiff -colorspace YUV -separate ${IMG}_YUV_%d.tga
	@display -resize 50% grid_YUV.tga &
	@display -resize 50% grid_YUV.tga &
	@display -resize 50% grid_YUV.tga &



ex6.2: out.png
	identify $<

out.png: ${IMG}.tiff
	${MAGICK} $< -resize 1067x ${IMG}_62a.tiff
	${MAGICK} ${IMG}_62a.tiff -gravity center -extent 1067x600 ${IMG}_62b.tiff
	${MAGICK} ${IMG}_62b.tiff -resize 800x600! $@

dash: dash.sh
	shc -o $@ -f $<

.PHONY: clean
clean:
	rm -f ${IMG}_*.tiff out*.png *.sh.x.c



