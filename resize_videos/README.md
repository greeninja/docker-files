### Resize portrait videos to 16:9 with fuzzy sides

```bash
$ docker run -e image_path=/Downloads -e image=img_1326-1.mp4 -e type=landscape -v /home/nick.campion/Downloads:/Downloads convert
```
---

### Convert to all web formats

```bash
$ docker run -e image_path=/Downloads -e image=img_1326-1 -e type=mov -v /home/nick.campion/Downloads:/Downloads convert
```

#### Resize Portrait images for display:

* This is using ImageMagick convert tool

```bash
$ convert img_1353.jpg -resize 1080x675 -quality 100 -background white -gravity center -extent 1080x675 test_img.jpg
```
