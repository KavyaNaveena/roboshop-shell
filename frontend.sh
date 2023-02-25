echo -e "\e[34mInstalling nginx \e[0m"
yum install nginx -y

echo -e "\e[35mRemoving Old Content \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[36mDownloading Frontend Content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[33mExtracting Downloaded content \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[34mCopying nginx configuration file "
cp configs/nginx.roboshop.conf /etc/nginx/deault.d/roboshop.conf

echo -e "\e[35mEnabling nginx \e[0m"
systemctl enable nginx

echo -e "\e[36mStarting nginx server \e[0m"
systemctl start nginx
