function psi = psi_view( psi_, view )
% PSI_VIEW Set psi in the view that it has been choosen, it can be:
% real = Real part of the function
% img  = Imaginary part of the function
% prob = Its abs squared

    % Set the view
    switch view
        case 'prob'
            psi = abs(psi_).^2;
        case 'real'
            psi = real(psi_);
        case 'img'
            psi = imag(psi_);
    end
end

