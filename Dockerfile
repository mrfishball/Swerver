FROM swift:4

WORKDIR /package

COPY . ./

RUN swift package clean
RUN swift build
CMD swift test --parallel