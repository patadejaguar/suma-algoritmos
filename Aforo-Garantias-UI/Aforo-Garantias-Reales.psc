//Proyecto SUMA SAFE-OSMS
//Creditos
//Aforo de Garantias Reales

//UI de Tabla de Aforo Requerido


Proceso getAforoACubrir
	ClaveDeCredito Es Entero;
	AforoSolicitado Es Real;
	ValorDeGarantias Es Real;
	AforoACubrir Es Real;

	
	AforoSolicitado <- getObtenerAforoSolicitado(ClaveDeCredito);
	ValorDeGarantias <- getValorDeGarantias(ClaveDeCredito);
	
	Si ValorDeGarantias >= AforoSolicitado Entonces
		AforoACubrir <- 0;
	SiNo
		AforoACubrir <- AforoSolicitado - ValorDeGarantias;
	FinSi

	
FinProceso


//Obtener los requerimientos de aforo
Funcion aforoSolicitado <- getObtenerAforoSolicitado(ClaveDeCredito)
	//Obtener el Objeto Producto de Credito por el ID de Credito
	//Obtener la Tasa de Aforo Solicitado por el Producto de Crédito
	//Referencia: http://207.180.221.129:8120/producto-credito/1/edit
	tasaDeGarantiaDelProductoDeCredito Es Real;
	montoDeGarantiaDelProductoDeCredito Es Real;
	montoSolicitadoDelCredito Es Real;
	esPorcentaje Es Logico;
	aforoSolicitado Es Real;
	
	Si esPorcentaje = Verdadero
		aforoSolicitado <- montoSolicitadoDelCredito * tasaDeGarantiaDelProductoDeCredito;
	SiNo
		aforoSolicitado <- montoDeGarantiaDelProductoDeCredito;
		
	FinSi
	
	
FinFuncion

//Obtener el valor de las garantias actuales.
Funcion valorDeGarantias <- getValorDeGarantias(ClaveDeCredito)
	valorDeGarantias Es Real;
	valorDeGarantiaActual Es Real;
	esTipoAceptadoPorProducto Es Logico;
	indice Es Entero;
	
	Dimension listaDeGarantiasEnDB[100];
	//Obtener el Valor de las Garantías sumando las garantías cuyo tipo sea correcto
	Mientras indice <= 100 Hacer
		Si esTipoAceptadoPorProducto = Verdadero
			valorDeGarantias <- valorDeGarantias + valorDeGarantiaActual;
		FinSi
	FinMientras
	
	
FinFuncion





//Luis Balam
//kernelcorebanking.com
