function regGrowing(imagen, mask, sem)
% Se lee y se umbraliza la imagen con la entrada rango.
% imagen=imread('..\Data\P3\hueso.tif');

% Se buscan todas las regiones y la propiedad de PixelList.
regions = regionprops(mask, 'PixelList');
% Se inicializa un indice que corresponderá a la región que se quiere
% segmentar y se busca cúal es la región que corresponde.
for i = 1 : size(regions)
    region =regions(i).PixelList;
    if ismember(sem, region)
        selected_region = i;
    end
end

% En caso de haber una región que corresponda a la semilla se mostrará por
% pantalla la imagen segmentada en rojo y en verde la semilla.
% En caso contrario se mostrará un error por la ventana de comando.
figure()
if selected_region ~=0
    imshow(imagen)
    hold on
    pl=prop(selected_region).PixelList;
    plot(pl(:,1),pl(:,2),'r')
    plot(sem(2),sem(1),'xg')
    hold off
    title('Result of growing region');
else
    fprintf(2,'ERROR: La semilla no se encuentra en ninguna región\n');
    close
end

end