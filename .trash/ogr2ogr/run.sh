# docker run --name gdal_container_name --rm -it ogr2ogr_gdal_image ogr2ogr -h
# docker exec gdal_container_name ls -la

# RUN='docker run --name gdal_container_name --rm -it ogr2ogr_gdal_image'
# bash -c $RUN ls -la
# docker run --name gdal_container_name --rm -it ogr2ogr_gdal_image ogr2ogr -h
docker run --name gdal_container_name --rm -it ogr2ogr_gdal_image ls -la

