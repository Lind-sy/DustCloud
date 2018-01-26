function [t,dx,dv] = euler_method_system(dust, dustspeed, h ,n)
new_dust = dust;
new_speed = dustspeed;
%Dsiplay dusts and center
subplot(1,2,2);
hold off
scatter3(0,0,0,10,'red', '.');
hold on
scatter3(new_dust(:,1),new_dust(:,2),new_dust(:,3), 10,'blue', '.');

dv = zeros(length(dust),3);
t(1)=0;
dx=new_speed;
Xc = calculateMassCenter(dust);%calclulate mass center
dustCount=countPointsInsideSphere(dust);%count all points inside spheres
%Display graphic
subplot(1,2,1);
plot(dustCount(:,2),dustCount(:,1), 'r');
axis([-1 (length(dustCount)+1) 0 inf]);
xlabel('Point') % x-axis label
ylabel('Points in sphere') % y-axis label

if(Xc(1,1)==0 && Xc(1,2)==0 && Xc(1,3)==0)
    disp('Mass center zero');
else
    for i = 2:n
        pause(0.5);
        t(i)= t(i-1)+h;%calculate time
        dv = dv+h.*dustMovement(new_dust);  %Calculate new accerelation
        dx =  dx+h.*dv; %Calculate velocity
        new_dust=new_dust+h.*dx; %Calculate new position
        dustCount=countPointsInsideSphere(new_dust);
        %Display dusts and graphic of points inside spheres
        subplot(1,2,1);
        hold off
        plot(dustCount(:,2),dustCount(:,1),'r');
        axis([-1 (length(dustCount)+1) 0 inf]);
        xlabel('Point') % x-axis label
        ylabel('Points in sphere') % y-axis label
        subplot(1,2,2);
        hold off
        scatter3(0,0,0,10,'red', '.');
        hold on
        scatter3(new_dust(:,1),new_dust(:,2),new_dust(:,3), 10,'blue', '.');
        axis tight;
    end
end
end