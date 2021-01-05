close all;
clear all;
clc;

%% ��������� ������
H=256;
W=256;
N=H*W*8;
x=zeros(1,N-1);
x1=12345678;
x=[x1,x];
c=0;
b=7^5;
p=(2^31)-1;
F=[1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1]; %����� � �������
%F= randint(1,16);%��������� ���������� ������
gamma=zeros(1,N);
for i=2:1:N+1
    
    if mod(i,1000)==0
        if gamma(1,i-1)==0
        n=x(1,i-1)^3;
        else
        n=x(1,i-100)^3;
        end
             x(1,i)=mod((n*b+c),p);
    else
    x(1,i)=mod((x(1,i-1)*b+c),p);
    end
%% ������������
%��������� � ��������
A=de2bi(x(1,i));
%��������� �����
adres=A(1,1:4);
%������ ���������� �������
%
if mod(i,1000)==0
 F = circshift(F',3);%������ ������
 F=F';
end

position_in_vector=bi2de(adres)+1;

gamma(1,i)=F(position_in_vector);
end

%% ���� �� ������������
figure(1);
ne_chet=x(1,1:2:end-1);
chet=x(1,2:2:end);

plot(chet,ne_chet,'black*');
 title('���� �� ������������ ������');
 grid on

%% ��������������
 G  = autocorr(x,10000);
 figure(2)
 plot(G);
 title('����������������� ������� ������');
 grid on







r=1;
MM=H*W;
gamma1=zeros(MM,8);
for i=1:1:MM
    for j=1:1:8
        gamma1(i,j)=gamma(1,r);
        
        r=r+1;
    end
end
%���������
gamma2=bi2de(gamma1);
cor_gamma=autocorr(gamma2,10000);
figure(3)
 plot(cor_gamma);
 title('����������������� ������� �����');
 grid on
 
 %% ���� �� ������������ gamma
figure(4);
ne_chet_gamma=gamma2(1:2:end,1);
chet_gamma=gamma2(2:2:end,1);

plot(chet_gamma,ne_chet_gamma,'black*');
 title('���� �� ������������ �����');
 grid on
 
%c������ ��������
%Image_color=imread('C:\Users\������\Desktop\1_����_������������\������\����� �����\2����\lena512.bmp');%�������� ����� 
Image_color=imread('C:\Users\������\Desktop\b2c1e6efa974405ba28b43109e8f3810.jpg');
YCBCR = rgb2ycbcr(Image_color);%������� � ��
figure(5);
imshow(YCBCR(:,:,1));
title('�������� �����������');

%�������� ������ ����������
Image_Y=YCBCR(:,:,1);
% Image_g=Image_color(:,:,2);
% Image_b=Image_color(:,:,3);

%����������
[ enc_im,vostanov_r ]  = gammirovanie( Image_Y,gamma1,H,W);

figure(6);
imshow(uint8(enc_im(:,:,1)));
title('������������� �����������');
%% ���� �������� ��������
encr_im_1=zeros(1,H*W);
% encr_im_2=zeros(1,H*W);
% encr_im_3=zeros(1,H*W);
g=1;
for i=1:1:H
    for j=1:1:W
       
            encr_im_1(1,g)=enc_im(i,j,1);
      
%             encr_im_2(1,g)=enc_im(i,j,2);
%         
%             encr_im_3(1,g)=enc_im(i,j,3);
     
    g=g+1;
    end
end
figure(8);
ne_chet_encr_im_1=encr_im_1(1,1:2:end-1);
chet_encr_im_1=encr_im_1(1,2:2:end);

plot(chet_encr_im_1,ne_chet_encr_im_1,'r*');
 title('���� �� ������������ �������������� �����������');
 grid on
 
%  figure(9);
% ne_chet_encr_im_2=encr_im_2(1,1:2:end-1);
% chet_encr_im_2=encr_im_2(1,2:2:end);
% 
% plot(chet_encr_im_2,ne_chet_encr_im_2,'g*');
%  title('���� �� ������������ �������������� �����������');
%  grid on
%  
%  figure(10);
% ne_chet_encr_im_3=encr_im_3(1,1:2:end-1);
% chet_encr_im_3=encr_im_3(1,2:2:end);
% 
% plot(chet_encr_im_3,ne_chet_encr_im_3,'b*');
%  title('���� �� ������������ �������������� �����������');
%  grid on
%% ������������
dec_im  =degammirovanie( vostanov_r,gamma1,H,W );

figure(7);
imshow(uint8(dec_im(:,:,1)));
title('�������������');
