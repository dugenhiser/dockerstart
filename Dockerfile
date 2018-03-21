FROM microsoft/aspnetcore-build AS build

WORKDIR /Docker

COPY . .

RUN dotnet restore

RUN dotnet publish --output /output --configuration Release

FROM microsoft/aspnetcore-build

COPY --from=build /output /app

WORKDIR /app

ENTRYPOINT [ "dotnet", "Docker.dll" ]
 
