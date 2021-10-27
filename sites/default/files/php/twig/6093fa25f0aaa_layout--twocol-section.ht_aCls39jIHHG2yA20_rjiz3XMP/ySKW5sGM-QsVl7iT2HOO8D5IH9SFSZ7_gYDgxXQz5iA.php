<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* core/themes/stable/layouts/twocol_section/layout--twocol-section.html.twig */
class __TwigTemplate_cb1f47e04bcc722e00221de0c0312765177d2e63a1db6e68cb159025d4fe617a extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $tags = ["if" => 11];
        $filters = ["escape" => 12];
        $functions = [];

        try {
            $this->sandbox->checkSecurity(
                ['if'],
                ['escape'],
                []
            );
        } catch (SecurityError $e) {
            $e->setSourceContext($this->getSourceContext());

            if ($e instanceof SecurityNotAllowedTagError && isset($tags[$e->getTagName()])) {
                $e->setTemplateLine($tags[$e->getTagName()]);
            } elseif ($e instanceof SecurityNotAllowedFilterError && isset($filters[$e->getFilterName()])) {
                $e->setTemplateLine($filters[$e->getFilterName()]);
            } elseif ($e instanceof SecurityNotAllowedFunctionError && isset($functions[$e->getFunctionName()])) {
                $e->setTemplateLine($functions[$e->getFunctionName()]);
            }

            throw $e;
        }

    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        // line 11
        if (($context["content"] ?? null)) {
            // line 12
            echo "  <div";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["attributes"] ?? null)), "html", null, true);
            echo ">

    ";
            // line 14
            if ($this->getAttribute(($context["content"] ?? null), "first", [])) {
                // line 15
                echo "      <div ";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "first", []), "addClass", [0 => "layout__region", 1 => "layout__region--first"], "method")), "html", null, true);
                echo ">
        ";
                // line 16
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "first", [])), "html", null, true);
                echo "
      </div>
    ";
            }
            // line 19
            echo "
    ";
            // line 20
            if ($this->getAttribute(($context["content"] ?? null), "second", [])) {
                // line 21
                echo "      <div ";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "second", []), "addClass", [0 => "layout__region", 1 => "layout__region--second"], "method")), "html", null, true);
                echo ">
        ";
                // line 22
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "second", [])), "html", null, true);
                echo "
      </div>
    ";
            }
            // line 25
            echo "
  </div>
";
        }
    }

    public function getTemplateName()
    {
        return "core/themes/stable/layouts/twocol_section/layout--twocol-section.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  92 => 25,  86 => 22,  81 => 21,  79 => 20,  76 => 19,  70 => 16,  65 => 15,  63 => 14,  57 => 12,  55 => 11,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "core/themes/stable/layouts/twocol_section/layout--twocol-section.html.twig", "/Applications/MAMP/htdocs/core/themes/stable/layouts/twocol_section/layout--twocol-section.html.twig");
    }
}
