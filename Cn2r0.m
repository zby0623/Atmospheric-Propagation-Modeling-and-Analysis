function r0scrn = Cn2r0(Dz,k,Cn2,nscr,sop)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nscr>1
    r0sw=(0.423*k^2*Cn2*3/8*Dz).^(-3/5);
    r0pw=(0.423*k^2*Cn2*Dz).^(-3/5);
    if sop==1
    p=linspace(0,Dz);
    rytov=0.563*k^(7/6)*sum(Cn2*(1-p/Dz).^(5/6).*p.^(5/6)*(p(2)-p(1)));
    A=zeros(2,nscr);
    alpha=(0:nscr-1)/(nscr-1);
    A(1,:)=alpha.^(5/3);
    A(2,:)=(1-alpha).^(5/6).*alpha.^(5/6);
    b=[r0sw.^(-5/3); rytov/1.33*(k/Dz)^(5/6)];
    x0=(nscr/3*r0sw*ones(nscr,1)).^(-5/3);
    fun=@(X)sum((A*X(:)-b).^2);
    x1=zeros(nscr,1);
    rmax=0.1;
    x2=rmax/1.33*(k/Dz)^(5/6)./A(2,:);
    [X,~,~,~]=fmincon(fun,x0,[],[],[],[],x1,x2);
    r0scrn=X.^(-3/5);
    r0scrn(isinf(r0scrn))=1E6;
    bp=A*X(:,:);
    disp(bp);
    else
    p=linspace(0,Dz);
    rytov=0.563*k^(7/6)*Dz^(5/6)*sum(Cn2*(1-p/Dz).^(5/6)*(p(2)-p(1)));
    A=ones(2,nscr);
    alpha=(0:nscr-1)/(nscr-1);
    A(2,:)=(1-alpha).^(5/6);
    b=[r0pw.^(-5/3); rytov/1.33*(k/Dz)^(5/6)];
    x0=(nscr/3*r0pw*ones(nscr,1)).^(-5/3);
    fun=@(X)sum((A*X(:)-b).^2);
    x1=zeros(nscr,1);
    rmax=0.1;
    x2=rmax/1.33*(k/Dz)^(5/6)./A(2,:);
    [X,~,~,~]=fmincon(fun,x0,[],[],[],[],x1,x2);
    r0scrn=X.^(-3/5);
    r0scrn(isinf(r0scrn))=1E6;
    bp=A*X(:,:);
    disp(bp);
    end
else
    if sop==1
        r0scrn=(0.423*k^2*Cn2*3/8*Dz).^(-3/5);
    else
        r0scrn=(0.423*k^2*Cn2*Dz).^(-3/5);
    end
end
end