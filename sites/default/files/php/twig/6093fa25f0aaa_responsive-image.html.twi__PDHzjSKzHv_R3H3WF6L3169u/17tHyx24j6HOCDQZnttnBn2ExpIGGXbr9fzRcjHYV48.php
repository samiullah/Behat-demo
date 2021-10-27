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

/* core/themes/stable/templates/field/responsive-image.html.twig */
class __TwigTemplate_dcdcc103547e6fbd62f86e14d7a110629e7fee1769ebe1d51411a7da02542e7a extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $tags = ["if" => 16, "for" => 21];
        $filters = ["escape" => 17];
        $functions = [];

        try {
            $this->sandbox->checkSecurity(
                ['if', 'for'],
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
        // line 16
        if (($context["output_image_tag"] ?? null)) {
            // line 17
            echo "  ";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["img_element"] ?? null)), "html", null, true);
            echo "
";
        } else {
            // line 19
            echo "  <picture>
    ";
            // line 20
            if (($context["sources"] ?? null)) {
                // line 21
                echo "      ";
                $context['_parent'] = $context;
                $context['_seq'] = twig_ensure_traversable(($context["sources"] ?? null));
                foreach ($context['_seq'] as $context["_key"] => $context["source_attributes"]) {
                    // line 22
                    echo "        <source";
                    echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($context["source_attributes"]), "html", null, true);
                    echo "/>
      ";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['source_attributes'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 24
                echo "    ";
            }
            // line 25
            echo "    ";
            // line 26
            echo "    ";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["img_element"] ?? null)), "html", null, true);
            echo "
  </picture>
";
        }
    }

    public function getTemplateName()
    {
        return "core/themes/stable/templates/field/responsive-image.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  87 => 26,  85 => 25,  82 => 24,  73 => 22,  68 => 21,  66 => 20,  63 => 19,  57 => 17,  55 => 16,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "core/themes/stable/templates/field/responsive-image.html.twig", "/Applications/MAMP/htdocs/core/themes/stable/templates/field/responsive-image.html.twig");
    }
}
