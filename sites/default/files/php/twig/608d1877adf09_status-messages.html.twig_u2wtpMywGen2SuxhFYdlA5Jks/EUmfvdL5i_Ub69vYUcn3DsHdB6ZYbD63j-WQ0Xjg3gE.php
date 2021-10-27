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

/* core/profiles/demo_umami/themes/umami/templates/components/messages/status-messages.html.twig */
class __TwigTemplate_ac88c7ca2808a94f9d020b5ec745a4711dc910563bcd853a723e2dc5edce5e93 extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
            'messages' => [$this, 'block_messages'],
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $tags = ["block" => 23, "for" => 24, "set" => 26, "if" => 33];
        $filters = ["escape" => 31, "without" => 31, "length" => 39, "first" => 46];
        $functions = [];

        try {
            $this->sandbox->checkSecurity(
                ['block', 'for', 'set', 'if'],
                ['escape', 'without', 'length', 'first'],
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
        // line 22
        echo "<div data-drupal-messages>
";
        // line 23
        $this->displayBlock('messages', $context, $blocks);
        // line 57
        echo "</div>
";
    }

    // line 23
    public function block_messages($context, array $blocks = [])
    {
        // line 24
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable(($context["message_list"] ?? null));
        foreach ($context['_seq'] as $context["type"] => $context["messages"]) {
            // line 25
            echo "  ";
            // line 26
            $context["classes"] = [0 => "messages", 1 => ("messages--" . $this->sandbox->ensureToStringAllowed(            // line 28
$context["type"]))];
            // line 31
            echo "  <div role=\"contentinfo\" aria-label=\"";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["status_headings"] ?? null), $context["type"], [], "array")), "html", null, true);
            echo "\"";
            echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->env->getExtension('Drupal\Core\Template\TwigExtension')->withoutFilter($this->sandbox->ensureToStringAllowed($this->getAttribute(($context["attributes"] ?? null), "addClass", [0 => ($context["classes"] ?? null)], "method")), "role", "aria-label"), "html", null, true);
            echo ">
    <div class=\"messages__content container\">
      ";
            // line 33
            if (($context["type"] == "error")) {
                // line 34
                echo "        <div role=\"alert\">
      ";
            }
            // line 36
            echo "        ";
            if ($this->getAttribute(($context["status_headings"] ?? null), $context["type"], [], "array")) {
                // line 37
                echo "          <h2 class=\"visually-hidden\">";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($this->getAttribute(($context["status_headings"] ?? null), $context["type"], [], "array")), "html", null, true);
                echo "</h2>
        ";
            }
            // line 39
            echo "        ";
            if ((twig_length_filter($this->env, $context["messages"]) > 1)) {
                // line 40
                echo "          <ul class=\"messages__list\">
            ";
                // line 41
                $context['_parent'] = $context;
                $context['_seq'] = twig_ensure_traversable($context["messages"]);
                foreach ($context['_seq'] as $context["_key"] => $context["message"]) {
                    // line 42
                    echo "              <li class=\"messages__item\">";
                    echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($context["message"]), "html", null, true);
                    echo "</li>
            ";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['message'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 44
                echo "          </ul>
        ";
            } else {
                // line 46
                echo "          <span class=\"messages__item\">";
                echo $this->env->getExtension('Drupal\Core\Template\TwigExtension')->escapeFilter($this->env, twig_first($this->env, $this->sandbox->ensureToStringAllowed($context["messages"])), "html", null, true);
                echo "</span>
        ";
            }
            // line 48
            echo "      ";
            if (($context["type"] == "error")) {
                // line 49
                echo "        </div>
      ";
            }
            // line 51
            echo "    </div>
  </div>
  ";
            // line 54
            echo "  ";
            $context["attributes"] = $this->getAttribute(($context["attributes"] ?? null), "removeClass", [0 => ($context["classes"] ?? null)], "method");
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['type'], $context['messages'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
    }

    public function getTemplateName()
    {
        return "core/profiles/demo_umami/themes/umami/templates/components/messages/status-messages.html.twig";
    }

    public function getDebugInfo()
    {
        return array (  141 => 54,  137 => 51,  133 => 49,  130 => 48,  124 => 46,  120 => 44,  111 => 42,  107 => 41,  104 => 40,  101 => 39,  95 => 37,  92 => 36,  88 => 34,  86 => 33,  78 => 31,  76 => 28,  75 => 26,  73 => 25,  69 => 24,  66 => 23,  61 => 57,  59 => 23,  56 => 22,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "core/profiles/demo_umami/themes/umami/templates/components/messages/status-messages.html.twig", "/Applications/MAMP/htdocs/core/profiles/demo_umami/themes/umami/templates/components/messages/status-messages.html.twig");
    }
}
