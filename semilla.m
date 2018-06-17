function semilla(sem,rango)
% Funci�n que recibe:
% sem (Vector con dos valores) que corresponden a la posici�n x,y de la
%semilla donde se quiere segmentar.
% rango (Vector con dos valores) rango de umbralizaci�n que delimite tu zona
%a segmentar

% Se lee y se umbraliza la imagen con la entrada rango.
imagen=imread('..\Data\P3\hueso.tif');
imagenu= imagen(:,:)>rango(1) & imagen(:,:)<rango(2);

% Se buscan todas las regiones y la propiedad de PixelList.
prop= regionprops(imagenu,'PixelList');

% Se inicializa un indice que corresponder� a la regi�n que se quiere
% segmentar y se busca c�al es la regi�n que corresponde.
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


% En caso de haber una regi�n que corresponda a la semilla se mostrar� por
% pantalla la imagen segmentada en rojo y en verde la semilla. 
% En caso contrario se mostrar� un error por la ventana de comando.
figure(1)
if indice ~=0
    imshow(imagen)
    hold on
    pl=prop(indice).PixelList;
    plot(pl(:,1),pl(:,2),'*r')
    plot(sem(2),sem(1),'*g')
else
    display('ERROR: La semilla no se encuentra en ninguna regi�n')
    
end

end