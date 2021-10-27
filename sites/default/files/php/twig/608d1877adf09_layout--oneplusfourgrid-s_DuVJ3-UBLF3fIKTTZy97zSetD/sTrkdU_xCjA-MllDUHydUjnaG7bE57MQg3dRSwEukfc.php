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

/* core/profiles/demo_umami/themes/umami/layouts/oneplusfourgrid_section/layout--oneplusfourgrid-section.html.twig */
class __TwigTemplate_62b47062448da1fc286bcacb261b9a65051c408fbe51b21fa04329d0782d8857 extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $tags = ["set" => 14, "if" => 19];
        $filters = ["escape" => 20];
        $functions = [];

        try {
            $this->sandbox->checkSecurity(
                ['set', 'if'],
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
        // line 14
        $context["classes"] = [0 => "layout", 1 => "layout--oneplusfourgrid-section"];
        // line 19
        if (($context["content"] ?? null)) {
            // line 20
            echo "  <div";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["attributes"] ?? null), "addClass", [0 => ($context["classes"] ?? null)], "method")), "html", null, true);
            echo ">

    ";
            // line 22
            if ($this->getAttribute(($context["content"] ?? null), "first", [])) {
                // line 23
                echo "      <div";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "first", []), "addClass", [0 => "layout__region", 1 => "layout__region--first"], "method")), "html", null, true);
                echo ">
        ";
                // line 24
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "first", [])), "html", null, true);
                echo "
      </div>
    ";
            }
            // line 27
            echo "
    ";
            // line 28
            if (((($this->getAttribute(($context["content"] ?? null), "second", []) || $this->getAttribute(($context["content"] ?? null), "third", [])) || $this->getAttribute(($context["content"] ?? null), "fourth", [])) || $this->getAttribute(($context["content"] ?? null), "fifth", []))) {
                // line 29
                echo "      <div class=\"layout__four-grid-group\">
    ";
            }
            // line 31
            echo "
      ";
            // line 32
            if ($this->getAttribute(($context["content"] ?? null), "second", [])) {
                // line 33
                echo "        <div";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "second", []), "addClass", [0 => "layout__region", 1 => "layout__region--second"], "method")), "html", null, true);
                echo ">
          ";
                // line 34
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "second", [])), "html", null, true);
                echo "
        </div>
      ";
            }
            // line 37
            echo "
      ";
            // line 38
            if ($this->getAttribute(($context["content"] ?? null), "third", [])) {
                // line 39
                echo "        <div";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "third", []), "addClass", [0 => "layout__region", 1 => "layout__region--third"], "method")), "html", null, true);
                echo ">
          ";
                // line 40
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "third", [])), "html", null, true);
                echo "
        </div>
      ";
            }
            // line 43
            echo "
      ";
            // line 44
            if ($this->getAttribute(($context["content"] ?? null), "fourth", [])) {
                // line 45
                echo "        <div";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "fourth", []), "addClass", [0 => "layout__region", 1 => "layout__region--fourth"], "method")), "html", null, true);
                echo ">
          ";
                // line 46
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "fourth", [])), "html", null, true);
                echo "
        </div>
      ";
            }
            // line 49
            echo "
      ";
            // line 50
            if ($this->getAttribute(($context["content"] ?? null), "fifth", [])) {
                // line 51
                echo "        <div";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute($this->getAttribute(($context["region_attributes"] ?? null), "fifth", []), "addClass", [0 => "layout__region", 1 => "layout__region--fifth"], "method")), "html", null, true);
                echo ">
          ";
                // line 52
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["content"] ?? null), "fifth", [])), "html", null, true);
                echo "
        </div>
      ";
            }
            // line 55
            echo "
    ";
            // line 56
            if (((($this->getAttribute(($context["content"] ?? null), "second", []) || $this->getAttribute(($context["content"] ?? null), "third", [])) || $this->getAttribute(($context["content"] ?? null), "fourth", [])) || $this->getAttribute(($context["content"] ?? null), "fifth", []))) {
                // line 57
                echo "      </div>
    ";
            }
            // line 59
            echo "
  </div>
";
        }
    }

    public function getTemplateName()
    {
        return "core/profiles/demo_umami/themes/umami/layouts/oneplusfourgrid_section/layout--oneplusfourgrid-section.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  160 => 59,  156 => 57,  154 => 56,  151 => 55,  145 => 52,  140 => 51,  138 => 50,  135 => 49,  129 => 46,  124 => 45,  122 => 44,  119 => 43,  113 => 40,  108 => 39,  106 => 38,  103 => 37,  97 => 34,  92 => 33,  90 => 32,  87 => 31,  83 => 29,  81 => 28,  78 => 27,  72 => 24,  67 => 23,  65 => 22,  59 => 20,  57 => 19,  55 => 14,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "core/profiles/demo_umami/themes/umami/layouts/oneplusfourgrid_section/layout--oneplusfourgrid-section.html.twig", "/Applications/MAMP/htdocs/core/profiles/demo_umami/themes/umami/layouts/oneplusfourgrid_section/layout--oneplusfourgrid-section.html.twig");
    }
}
