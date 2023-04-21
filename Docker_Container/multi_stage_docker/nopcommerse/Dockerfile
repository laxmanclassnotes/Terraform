FROM ubuntu:22.04 AS builder
RUN apt update && apt install unzip -y
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip /nop_dot/nopCommerce_4.60.2_NoSource_linux_x64.zip
RUN cd nop_dot && unzip nopCommerce_4.60.2_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="laxman" organization="QualityThought"
COPY --from=builder nop_dot nop_ecommerse
WORKDIR /nop_ecommerse
EXPOSE 5000
CMD [ "dotnet", "Nop.Web.dll", "--urls", "http://0.0.0.0:5000" ]

# docker image build -t nop .
# docker container run -d --name nopcommerse -P nop
