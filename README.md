# FinBank-Digital

## III. Infraestructura de TI
### III.1. Escaneo de vulnerabilidades en servidores (Nessus)
- Se utilizarán herramientas como **Nessus** para identificar vulnerabilidades en servidores críticos.
- Se generarán reportes detallados de vulnerabilidades encontradas y posibles mitigaciones.

### III.2. Análisis de tráfico de red (Wireshark)
- Captura y análisis de paquetes de red para detectar posibles amenazas o anomalías.
- Identificación de patrones de tráfico sospechoso y posibles intentos de intrusión.

### III.3. Seguridad perimetral en Azure
- Revisión de configuración y acceso en la infraestructura de **Azure**.
- Implementación de buenas prácticas en la gestión de firewall y reglas de acceso.

---

## IV. Aplicaciones y Bases de Datos

### IV.1. Pruebas de seguridad en APIs (Postman)
#### Configuración y Verificación de Herramienta:

- **Postman:**
  - Confirmar que la aplicación carga correctamente sin errores en la interfaz.
  - Asegurar que la aplicación esté correctamente iniciada.
  - Verificar que el **proxy** está activo en la interfaz `127.0.0.1` y el puerto `8080`.
  - Iniciar el modo de **intercepción de tráfico**.

#### Pruebas con API de Seguridad:
- Se utilizará la API vulnerable de prueba desde GitHub:
  - [DVWS-Node](https://github.com/snoopysecurity/dvws-node)
- Se realizarán pruebas de seguridad enfocadas en entornos financieros.

### IV.1.0. Inyección SQL en SQL Server y MongoDB (SQLMap/Postman SQLScan)
- Uso de **SQLMap** y **Postman SQLScan** para detectar vulnerabilidades de inyección SQL.
- Pruebas dirigidas a bases de datos **SQL Server** y **MongoDB**.

### IV.1.1. Evaluación de autenticación multifactor (iAuditor)
- Revisión de la implementación de **MFA** en accesos a sistemas críticos.
- Validación de políticas de autenticación en **iAuditor**.

### IV.1.2. Evaluación del procesamiento de pagos en tiempo real
- Pruebas en sistemas transaccionales para detectar fraudes.
- Simulación de pagos en entornos de prueba.

---

## IV.2. Seguridad y Cumplimiento

### IV.2.0. Revisión de cumplimiento PCI DSS (iAuditor)
- Validación de estándares **PCI DSS** en sistemas y aplicaciones.

### IV.2.1. Análisis de gestión de claves criptográficas (Sambix)
- Evaluación de almacenamiento y manejo de claves de cifrado.

### IV.2.2. Validación de monitoreo y gestión de incidentes (Sambix/iAuditor )
- Revisión de herramientas de **SIEM** para la detección y respuesta ante incidentes.

### IV.2.3. Evaluación de normativas bancarias y reportería financiera
- Validación del cumplimiento regulatorio con **iAuditor **.

### IV.2.4. Auditoría de políticas anti-lavado de dinero
- Revisión de controles y detección de transacciones sospechosas.

---

## IV.3. Disponibilidad y Resiliencia de la Infraestructura

### IV.3.0. Evaluación de SLAs y escalabilidad de la plataforma
- Pruebas de carga y disponibilidad

### IV.3.1. Pruebas de respuesta ante incidentes
- Simulación de ataques y validación de tiempos de respuesta.

### IV.3.2. Monitoreo de transacciones y detección de fraudes
- Análisis de logs y eventos de seguridad.

---

📌 **Este repositorio se actualizará con nuevas pruebas y mejoras en la auditoría de seguridad de FinBank Digital.**
