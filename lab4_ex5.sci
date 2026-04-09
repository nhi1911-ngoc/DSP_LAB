/** 
  ***********************************************************
  * @author         : Nhi Le
  * @course         : DSP
  * @lab number     : 4
  * @exercises      : 5
  * @brief          : Image Processing using IPCV
  * @date created   : 04-08-2026 (mm-dd)
  * @last modified  : 04-09-2026
  ***********************************************************
**/

// Setup
atomsLoad("IPCV") 
img = imread("E:\Pictures\lena.png")
img = double(img)
[rows, cols, ch] = size(img)

// Grayscale
gray = 0.299*img(:,:,1) + 0.587*img(:,:,2) + 0.114*img(:,:,3)

if max(gray) <= 1 then
    gray = gray * 255
end

gray = uint8(gray)

// -------- BLUR -------- //
h = fspecial("gaussian", [15 15], 5)
img_blur = imfilter(uint8(img), h)

// -------- HISTOGRAM -------- //
hist_vals = zeros(1,256)

for i = 1:rows
    for j = 1:cols
        val = gray(i,j)
        hist_vals(val + 1) = hist_vals(val + 1) + 1
    end
end

// -------- WATERMARK -------- //
// Text (DSP)
D = [
1 1 1 0;
1 0 0 1;
1 0 0 1;
1 0 0 1;
1 0 0 1;
1 0 0 1;
1 1 1 0
];

S = [
0 1 1 1;
1 0 0 0;
1 0 0 0;
0 1 1 0;
0 0 0 1;
0 0 0 1;
1 1 1 0
];

P = [
1 1 1 0;
1 0 0 1;
1 0 0 1;
1 1 1 0;
1 0 0 0;
1 0 0 0;
1 0 0 0
];

// Add text
space = zeros(7,2)
text_small = [D space S space P]

// Scale up
scale = 20
wm_mask = kron(text_small, ones(scale, scale))

// Centering
wm_full = zeros(rows, cols)
[h, w] = size(wm_mask)
r0 = int((rows - h)/2)
c0 = int((cols - w)/2)
wm_full(r0+1:r0+h, c0+1:c0+w) = wm_mask

// Smooth
h_wm = fspecial("gaussian", [15 15], 3)
wm_full = imfilter(wm_full, h_wm)

// Normalize
wm_full = wm_full / max(wm_full)

// Blend
alpha = 0.6
img_wm = img

for c = 1:3
    img_wm(:,:,c) = img(:,:,c) .* (1 - alpha*wm_full) + 255*(alpha*wm_full)
end

img_wm = uint8(img_wm)


// -------- DISPLAY -------- //
clf()

subplot(2,2,1)
imshow(uint8(img))
xtitle("Original image")

subplot(2,2,2)
bar(0:255, hist_vals)
xtitle("Histogram")

subplot(2,2,3)
imshow(uint8(img_blur))
xtitle("Blurred image")

subplot(2,2,4)
imshow(img_wm)
xtitle("Watermark image")
