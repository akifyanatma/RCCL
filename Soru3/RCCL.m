tic;
B = imread('labirent.pgm'); 
%B = imread('semboller.pgm');
B = im2bw(B);

figure;
imshow(B); 
title('original labirent.pgm');


set(0,'RecursionLimit',5000)

rowCount = size(B,1); % B Matrisi row sayisi
colCount = size(B,2); % B Matrisi coloumn sayisi

%Binary image icindeki 1 intensity degerleri -1 yapiliyor, negate islemi.
LB = zeros(rowCount, colCount); %Original B image boyutlarinda zero matrisi olusturuluyor

for row = 1:rowCount
  for col = 1:colCount 
      if B(row, col) == 1
          LB(row, col) = -1;
      end
  end
end
%%%%%%%%%%%%%%%%%%%%

label = 0;
neighborsCount = 4; %Komsuluk sayisi buradan 4 veya 8 olarak ayarlanabilir.
searchCount=0;

%Componentler bulunuyor
for row = 1:rowCount
    
  for col = 1:colCount 
      
      if LB(row, col) == -1
          label = label+1;
          LB = search(LB, label, row, col, rowCount, colCount, neighborsCount, searchCount); 
      end
      
  end
  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toc;

resultIm = mat2gray(LB); %Componentleri farkli renklerde gorebilmek icin bu donusum yapildi.
                         %Ancak bu donusum ile intensity value degerleri
                         %tamsayi olarak gozukmuyor. LB image nin intensity
                         %degerleri ise tam sayi olarak gozukmekte ancak
                         %onun da componentlerinin hepsi beyaz olarak
                         %gozukmektedir.
                         
                      
figure;
imshow(resultIm);

% 4-komsuluk labirent
 title('4-komusuluk labirent image');
 imwrite(resultIm, 'labirent_4_neighbour.pgm');

% 8-komsuluk labirent
% title('8-komsuluk labirent image');
% imwrite(resultIm, 'labirent_8_neighbour.pgm');

% 4-komsuluk semboller
% title('4-komsuluk semboller image');
% imwrite(resultIm, 'semboller_4_neighbour.pgm');

% 8-komsuluk semboller
% title('8-komsuluk semboller image');
% imwrite(resultIm, 'semboller_8_neighbour.pgm');






