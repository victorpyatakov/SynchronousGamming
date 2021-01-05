function [ enc_im,vostanov_rr ] = gammirovanie( Image_RED,gamma,H,W)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%перевод из 10 в 2 все интенсивности
bin_im_red=de2bi(Image_RED);
% bin_im_g=de2bi(Image_g);
% bin_im_b=de2bi(Image_b);
%шифрование картинки и гаммы
Im_enc_red=xor(bin_im_red(:,:),gamma(:,:));
% Im_enc_g=xor(bin_im_g(:,:),gamma(:,:));
% Im_enc_b=xor(bin_im_b(:,:),gamma(:,:));
%восстановение из 2 в 10
vostanov_rr=zeros(H,W);
% vostanov_gg=zeros(H,W);
% vostanov_bb=zeros(H,W);
l=1;
for i=1:1:W
    for j=1:1:H
        vostanov_rr(j,i)=bi2de(Im_enc_red(l,:));
%         vostanov_gg(j,i)=bi2de(Im_enc_g(l,:));
%         vostanov_bb(j,i)=bi2de(Im_enc_b(l,:));
        l=l+1;
    end
end

enc_im(:,:,1)=vostanov_rr;
% enc_im(:,:,2)=vostanov_gg;
% enc_im(:,:,3)=vostanov_bb;

end

