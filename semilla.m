function semilla(sem,rango)
% Función que recibe:
% sem (Vector con dos valores) que corresponden a la posición x,y de la
%semilla donde se quiere segmentar.
% rango (Vector con dos valores) rango de umbralización que delimite tu zona
%a segmentar

% Se lee y se umbraliza la imagen con la entrada rango.
imagen=imread('..\Data\P3\hueso.tif');
imagenu= imagen(:,:)>rango(1) & imagen(:,:)<rango(2);

% Se buscan todas las regiones y la propiedad de PixelList.
prop= regionprops(imagenu,'PixelList');

% Se inicializa un indice que corresponderá a la región que se quiere
% segmentar y se busca cúal es la región que corresponde.
indice=0;
for i=1:size(prop)
    prop1=prop(i).PixelList;
    sp=size(prop1);
    for j=1:sp(1)
        
         if prop1(j,1:2)==[sem(2),sem(1)]
            indice=i;
         end
    end
end


% En caso de haber una región que corresponda a la semilla se mostrará por
% pantalla la imagen segmentada en rojo y en verde la semilla. 
% En caso contrario se mostrará un error por la ventana de comando.
figure(1)
if indice ~=0
    imshow(imagen)
    hold on
    pl=prop(indice).PixelList;
    plot(pl(:,1),pl(:,2),'*r')
    plot(sem(2),sem(1),'*g')
else
    display('ERROR: La semilla no se encuentra en ninguna región')
    
end

end