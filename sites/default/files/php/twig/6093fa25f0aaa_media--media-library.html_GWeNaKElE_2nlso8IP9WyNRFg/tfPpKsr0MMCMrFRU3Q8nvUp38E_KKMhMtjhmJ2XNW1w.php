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

/* core/themes/seven/templates/classy/media-library/media--media-library.html.twig */
class __TwigTemplate_9f980043a58bdca5556204c482ce08aaac64816e03bce362c165e423ea797638 extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $tags = ["if" => 42];
        $filters = ["escape" => 41, "without" => 44, "t" => 47];
        $functions = [];

        try {
            $this->sandbox->checkSecurity(
                ['if'],
                ['escape', 'without', 't'],
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
        // line 41
        echo "<article";
        echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["attributes"] ?? null)), "html", null, true);
        echo ">
  ";
        // line 42
        if (($context["content"] ?? null)) {
            // line 43
            echo "    <div";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["preview_attributes"] ?? null), "addClass", [0 => "media-library-item__preview js-media-library-item-preview"], "method")), "html", null, true);
            echo ">
      ";
            // line 44
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->env->getExtension('Drupal\Core\Template\TwigExtension')->withoutFilter($this->sandbox->ensureToStringAllowed(($context["content"] ?? null)), "name"), "html", null, true);
            echo "
    </div>
    ";
            // line 46
            if ( !($context["status"] ?? null)) {
                // line 47
                echo "      <div class=\"media-library-item__status\">";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->renderVar(t("unpublished"));
                echo "</div>
    ";
            }
            // line 49
            echo "    <div";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["metadata_attributes"] ?? null), "addClass", [0 => "media-library-item__attributes"], "method")), "html", null, true);
            echo ">
      <div class=\"media-library-item__name\">
        ";
            // line 51
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["name"] ?? null)), "html", null, true);
            echo "
      </div>
    </div>
  ";
        }
        // line 55
        echo "</article>
";
    }

    public function getTemplateName()
    {
        return "core/themes/seven/templates/classy/media-library/media--media-library.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  93 => 55,  86 => 51,  80 => 49,  74 => 47,  72 => 46,  67 => 44,  62 => 43,  60 => 42,  55 => 41,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "core/themes/seven/templates/classy/media-library/media--media-library.html.twig", "/Applications/MAMP/htdocs/core/themes/seven/templates/classy/media-library/media--media-library.html.twig");
    }
}
