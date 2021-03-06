#Metodo iterativo para resolver sistemas de ecuaciones mediante el metodo de la pseudoinversa
#Entradas: A sistema de ecuaciones, b vector con las igualdades del sistema, itermax numero maximo de iteraciones, tol tolrenacia para el error
#Salidas: xk vector solucion del sistema, k numero de iteraciones, error
def pinversa(A, b, itermax, tol):
    X = (1/(norm(A)**2))*(transpose(A)) #Se define X0 segun la formula
    xk = X * b #Se define xk segun la formula
    m = len(A[0])
    I = identity_matrix(m)
    k = 0
    I = 2*I #Se define una matriz auxiliar I siendo 2*Im
    error = tol + 1 #Se define un error inicial
    # Se itera hasta tener un error menor a la tolerancia o llegar a las iteraciones maximas
    while k < itermax and error > tol:
        X = X*(I-A*X) #Se actualiza XK
        xkn = X * b #Se define xkn con el nuevo valor de xk usando XK
        error = norm(xkn - xk) / norm(xkn) #Se calcula el error con la formula utilizando el valor de xk y xkn
        xk = xkn #Se actualiza xk
        k += 1
    return [xk, k, error]









