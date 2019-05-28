# specify the node base image with your desired version node:<version>
# https://mherman.org/blog/dockerizing-an-angular-app/
FROM node:12.2.0

# set working directory
WORKDIR /app


# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH


# install and cache app dependencies
COPY package.json /app/package.json
# add app
COPY . /app



RUN npm install
RUN npm install -g @angular/cli

# replace this with your application's default port
EXPOSE 4200



# start app
CMD ng serve --host 0.0.0.0 --disableHostCheck
