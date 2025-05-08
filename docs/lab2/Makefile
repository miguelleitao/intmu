
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

ex6.2: out.png
	identify $<

out.png: ${IMG}.tiff
	${MAGICK} $< -resize 1067x ${IMG}_62a.tiff
	${MAGICK} ${IMG}_62a.tiff -gravity center -extent 1067x600 ${IMG}_62b.tiff
	${MAGICK} ${IMG}_62b.tiff -resize 800x600! $@

dash: dash.sh
	shc -o $@ -f $<

clean:
	rm -f ${IMG}_*.tiff out*.png



