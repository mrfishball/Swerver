FROM swiftdocker/swift
ADD . /Swerver
WORKDIR /Swerver
RUN swift package clean
RUN swift build
EXPOSE 5050
ENTRYPOINT [".build/debug/SwerverRunner"]