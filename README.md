# AVIF vs WebP Conversion Benchmark

This repository is a companion for https://github.com/vercel/next.js/pull/20765, which aims to bring first-class support for the [AVIF](https://jakearchibald.com/2020/avif-has-landed/) image format, thanks to [sharp](https://sharp.pixelplumbing.com/). This repo is helpful to compare the time taken to convert images to WebP & AVIF (or actually any format that sharp can support).

<small>Test image from https://www.pexels.com/photo/person-sitting-in-front-of-the-taj-mahal-2387871/</small>

### What the benchmark does

Every run reads the source image from disk, rotates (if there's EXIF data asking to do it), reads metadata, and converts the image to the target format (without writing to disk). I'm not including the write in the benchmark because it doesn't affect the image conversion.

### Usage

```bash
./run-bench.sh <file-path> <avif/webp> <run-count>
```

**Example**

```bash
./run-bench.sh pexels-sam-kolder-2387871-S.jpg avif 100
```

### Sample Results

On my mid-2014 13" MacBook Pro with a 2.6 GHz Dual-Core Intel Core i5 processor and 8 GB 1600 MHz DDR3 RAM, here's results —

_Converting a **large** JPG image (1920 × 2504) to **WebP** (total runtime of 2m 15s)_
```
 ./run-bench.sh pexels-sam-kolder-2387871-L.jpg webp 1000

Sharp pexels-sam-kolder-2387871-L.jpg -> webp Conversion (1000 runs)
Average time = .2961174730 ms
```

_Converting a **large** JPG image (1920 × 2504) to **AVIF** (total runtime of 2m 24s)_
```
 ./run-bench.sh pexels-sam-kolder-2387871-L.jpg avif 1000

Sharp pexels-sam-kolder-2387871-L.jpg -> avif Conversion (1000 runs)
Average time = .2261837420 ms
```

_Converting a **medium** JPG image (1280 × 1669) to **WebP** (total runtime of 2m 16s)_
```
 ./run-bench.sh pexels-sam-kolder-2387871-M.jpg webp 1000

Sharp pexels-sam-kolder-2387871-M.jpg -> webp Conversion (1000 runs)
Average time = .2761548210 ms
```

_Converting a **medium** JPG image (1280 × 1669) to **AVIF** (total runtime of 2m 23s)_
```
 ./run-bench.sh pexels-sam-kolder-2387871-M.jpg avif 1000

Sharp pexels-sam-kolder-2387871-M.jpg -> avif Conversion (1000 runs)
Average time = .2373165780 ms
```

_Converting a **small** JPG image (640 × 834) to **WebP** (total runtime of 2m 23s)_
```
 ./run-bench.sh pexels-sam-kolder-2387871-S.jpg webp 1000

Sharp pexels-sam-kolder-2387871-S.jpg -> webp Conversion (1000 runs)
Average time = .2731627210 ms
```

_Converting a **small** JPG image (640 × 834) to **AVIF** (total runtime of 2m 25s)_
```
 ./run-bench.sh pexels-sam-kolder-2387871-S.jpg avif 1000

Sharp pexels-sam-kolder-2387871-S.jpg -> avif Conversion (1000 runs)
Average time = .2406256660 ms
```

<hr/>

**About CPU and Memory usage**

CPU and memory usage was very negligible (given how well optimized sharp is) and so aren't included in the results.
