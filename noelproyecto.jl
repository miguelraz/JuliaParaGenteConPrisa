using SparseArrays
using Plots

#% Crea la malla.
nx = 50;
ny = 60;
#xvec = linspace( 0.0, 2.4, nx );
xvec = range(stop = 2.4,start = 0, length = nx)
#yvec = linspace ( 0.0, 3.0, ny );
yvec = range(start = 0, stop = 3.0, length = ny)

# [ xmat, ymat ] = meshgrid ( xvec, yvec );
xmat = xvec' .* ones(ny)
ymat = ones(nx)' .* yvec
#mat = [(i,j) for i in xvec, j in yvec]
#xmat = first.(mat); ymat = last.(mat)

#%  Llama la funcion principal.
function u = fd2d_heat_steady ( nx, ny, x, y, d, f )
    #%  Numero total de ecuaciones.
    n = nx * ny;
    #%  Crea la matriz dispersa
    A = sparse ( [], [], [], n, n, 5 * n )
    #A = sparse()
    rhs = zeros(n, 1)
    
    %  Matriz en los puntos interiores.
    [ A, rhs ] = interior ( nx, ny, x, y, d, f, A, rhs );
    
    %  Condiciones de frontera.
    [ A, rhs ] = boundary ( nx, ny, x, y, A, rhs );
    
    %  Resuelve el sistema de ecuaciones
    u = A \ rhs;
    
    return
end
#u = fd2d_heat_steady ( nx, ny, xvec, yvec, @d, @f );

umat = reshape(u,nx, ny)
xmat = xmat'
ymat = ymat'

#%Grafica la solucion
contourf ( xmat, ymat, umat );
xlabel('X')
ylabel('Y')
title('Solution of steady heat equation')
colorbar
grid on


function value = d ( x, y )
    # Coefficiente de conductividad termica.
    value = 1.0;
    return
end
function value = f ( x, y )
    # Termino fuente.
    value = 0.0;
    return
end

function [ A, rhs ] = interior ( nx, ny, x, y, d, f, A, rhs )

    dx = x(2) - x(1);
    dy = y(2) - y(1);
    
    for ic = 2 : ny - 1
        for jc = 2 : nx - 1
            in = ic + 1;
            is = ic - 1;
            je = jc + 1;
            jw = jc - 1;
            
            kc = ( ic - 1 ) * nx + jc;
            ke = kc + 1;
            kw = kc - 1;
            kn = kc + nx;
            ks = kc - nx;
            
            dce = d( 0.5 * ( x(jc) + x(je) ),         y(ic) );
            dcw = d( 0.5 * ( x(jc) + x(jw) ),         y(ic) );
            dcn = d(         x(jc),           0.5 * ( y(ic) + y(in) ) );
            dcs = d(         x(jc),           0.5 * ( y(ic) + y(is) ) );
            
            A(kc,kc) = ( dce + dcw ) / dx / dx + ( dcn + dcs ) / dy / dy;
            A(kc,ke) = - dce         / dx / dx;
            A(kc,kw) =       - dcw   / dx / dx;
            A(kc,kn) =                           - dcn         / dy / dy;
            A(kc,ks) =                                 - dcs   / dy / dy;
            
            rhs(kc,1) = f ( x(jc), y(ic) );
        end
    end
    
    return
end

function [ A, rhs ] = boundary ( nx, ny, x, y, A, rhs )
    
    %  Izquierda.
    j = 1;
    for i = 1 : ny
        kc = ( i - 1 ) * nx + j;
        xc = x(j);
        yc = y(i);
        A(kc,kc) = 1.0;
        rhs(kc,1) = 75.0;
    end
    
    
    %  Derecha.
    j = nx;
    for i = 1 : ny
        kc = ( i - 1 ) * nx + j;
        xc = x(j);
        yc = y(i);
        A(kc,kc) = 1.0;
        rhs(kc,1) = 100.0;
    end
    
    %  Abajo.
    i = 1;
    for j = 1 : nx
        kc = ( i - 1 ) * nx + j;
        xc = x(j);
        yc = y(i);
        A(kc,kc) = 1.0;
        rhs(kc,1) = 50.0;
    end
    
    
    %  Arriba.
    i = ny;
    for j = 1 : nx
        kc = ( i - 1 ) * nx + j;
        xc = x(j);
        yc = y(i);
        A(kc,kc) = 1.0;
        rhs(kc,1) = 300.0;
    end
    return
end