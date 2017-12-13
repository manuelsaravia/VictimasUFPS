<nav>
    <div class="nav-wrapper negro">
        <a href="principal.jsp" class="brand-logo" style="margin-left: 10px;">VICTIUFPS</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="principal.jsp">Inicio<i class="material-icons right">home</i></a></li>
            <li><a class="dropdown-button" href="#!" data-activates="estudiante">Estudiante<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" href="#!" data-activates="actividad">Actividad<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" href="#!" data-activates="semestre">Semestre<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a href="reportes.jsp" >Reportes</a></li>
        </ul>
    </div>
</nav>
<!-- Dropdown Structure -->
<ul id="estudiante" class="dropdown-content">
    <li><a href="../proc/cargarRegistroEstudiante.jsp">Registrar</a></li>
    <li><a href="consultarEstudiante.jsp">Consultar</a></li>
    <li><a href="seguimiento.jsp">Seguir</a></li>
    <li><a href="acompanamiento.jsp">Acompañar</a></li>
    <li><a href="anexarExpediente.jsp">Anexar</a></li>
</ul>
<ul id="actividad" class="dropdown-content">
    <li><a href="actividad.jsp">Registrar</a></li>
    <li><a href="#" onclick="cargarActividades()">Procesar</a></li>
    <li class="divider"></li>
    <li><a href="#" onclick="cargarActividadesHis()">Historial</a></li>
</ul>
<ul id="semestre" class="dropdown-content">
    <li><a href="semestre.jsp">Crear</a></li>
    <li><a href="#" onclick="cargarSemestres();">Activar</a></li>
</ul>
