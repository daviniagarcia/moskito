<%@ page language="java" contentType="text/html;charset=UTF-8" session="true" %>
<%@ taglib prefix="ano" uri="http://www.anotheria.net/ano-tags" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="../../shared/jsp/Header.jsp" flush="false"/>
<section id="main">
    <div class="content">

        <div class="box">
            <div class="box-title">
                <a class="accordion-toggle tooltip-bottom" title="Close/Open" data-toggle="collapse" href="#collapse1"><i class="fa fa-caret-right"></i></a>
                <h3 class="pull-left">
                    Current configuration (local).
                </h3>
            </div>
            <div id="collapse1" class="box-content accordion-body collapse in">
                <pre class="prettyprint linenums"><code class="language-js"><ano:write name="configstring"/></code></pre>
            </div>
        </div>

        <ano:present name="remoteConfig">
            <div class="box">
                <div class="box-title">
                    <a class="accordion-toggle tooltip-bottom" title="Close/Open" data-toggle="collapse" href="#collapse2"><i class="fa fa-caret-right"></i></a>
                    <h3 class="pull-left">
                        Remote configuration of the connected component.
                    </h3>
                </div>
                <div id="collapse2" class="box-content accordion-body collapse in">
                    <pre class="prettyprint linenums"><code class="language-js"><ano:write name="remoteConfig"/></code></pre>
                </div>
            </div>
        </ano:present>

        <div class="box">
            <div class="box-title">
                <a class="accordion-toggle tooltip-bottom" title="Close/Open" data-toggle="collapse" href="#collapse3"><i class="fa fa-caret-right"></i></a>
                <h3 class="pull-left">
                    Configured thresholds
                </h3>
            </div>
            <div id="collapse3" class="box-content accordion-body collapse in">
                <pre class="prettyprint linenums"><code class="language-js"><ano:iterate name="thresholdsStrings" id="t"><ano:write name="t"/></ano:iterate></code></pre>
            </div>
        </div>

        <div class="box">
            <div class="box-title">
                <a class="accordion-toggle tooltip-bottom" title="Close/Open" data-toggle="collapse" href="#collapse4"><i class="fa fa-caret-right"></i></a>
                <h3 class="pull-left">
                    Chart Engines
                </h3>
            </div>
            <div id="collapse4" class="box-content accordion-body collapse in">
                <div class="paddner">
                    <b>Available engines:</b>

                    <ul>
                    <ano:iterate name="availableChartEngines" id="engine">
                        <li><ano:write name="engine"/>, parameters: <ano:iterate name="engine" property="names" id="n"> <ano:write name="n"/></ano:iterate></li>
                    </ano:iterate>
                    </ul>
                    <b>Selected engine:</b>
                    <ul>
                        <li><ano:write name="chartEngine"/></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="box">
            <div class="box-title">
                <a class="accordion-toggle tooltip-bottom" title="Close/Open" data-toggle="collapse" href="#collapse5"><i class="fa fa-caret-right"></i></a>
                <h3 class="pull-left">
                    WebUI Config (mskwebui.json)
                </h3>
            </div>
            <div id="collapse5" class="box-content accordion-body collapse in">
                <dl class="dl-horizontal pull-left">
                    <dt>producerChartWidth:</dt>
                    <dd>${config.producerChartWidth}</dd>
                    <dt>producerChartHeight:</dt>
                    <dd>${config.producerChartHeight}</dd>
                    <dt>defaultChartEngine:</dt>
                    <dd>${config.defaultChartEngine}</dd>
                    <dt>connectivityMode:</dt>
                    <dd>${config.connectivityMode}</dd>
                    <dt>usageMode:</dt>
                    <dd>${config.usageMode}</dd>
                </dl>
                <div class="paddner">
                    <b>Remotes:</b>
                    <ul>
                        <ano:iterate id="remote" type="net.anotheria.moskito.webui.util.RemoteInstance" name="config" property="remotes">
                            <li>${remote}</li>
                        </ano:iterate>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../../shared/jsp/Footer.jsp" flush="false"/>

</section>
</body>
</html>