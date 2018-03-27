require_relative '../../../spec_helper'

describe Web::Views::Repos::Index do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/repos/index.html.slim') }
  let(:view)      { Web::Views::Repos::Index.new(template, exposures) }

  describe '#select_repos_by_language' do
    let(:exposures) { { params: {} } }

    it 'returns form' do
      expect(view.select_repos_by_language.to_s).to eq "<form action=\"/\" method=\"GET\" accept-charset=\"utf-8\" id=\"repos-form\">\n" \
                                                       "<select name=\"repos[language]\" id=\"git-repo-language-select\">\n" \
                                                       "<option value=\"all\">All</option>\n" \
                                                       "<option value=\"ActionScript\">ActionScript</option>\n" \
                                                       "<option value=\"C\">C</option>\n" \
                                                       "<option value=\"C#\">C#</option>\n" \
                                                       "<option value=\"C++\">C++</option>\n" \
                                                       "<option value=\"CSS\">CSS</option>\n" \
                                                       "<option value=\"Clojure\">Clojure</option>\n" \
                                                       "<option value=\"CoffeeScript\">CoffeeScript</option>\n" \
                                                       "<option value=\"ColdFusion\">ColdFusion</option>\n" \
                                                       "<option value=\"Elixir\">Elixir</option>\n" \
                                                       "<option value=\"Emacs Lisp\">Emacs Lisp</option>\n" \
                                                       "<option value=\"Erlang\">Erlang</option>\n" \
                                                       "<option value=\"F#\">F#</option>\n" \
                                                       "<option value=\"Go\">Go</option>\n" \
                                                       "<option value=\"Groovy\">Groovy</option>\n" \
                                                       "<option value=\"HTML\">HTML</option>\n" \
                                                       "<option value=\"Haskell\">Haskell</option>\n" \
                                                       "<option value=\"Java\">Java</option>\n" \
                                                       "<option value=\"JavaScript\">JavaScript</option>\n" \
                                                       "<option value=\"Julia\">Julia</option>\n" \
                                                       "<option value=\"Jupyter Notebook\">Jupyter Notebook</option>\n" \
                                                       "<option value=\"Kotlin\">Kotlin</option>\n" \
                                                       "<option value=\"Logos\">Logos</option>\n" \
                                                       "<option value=\"Lua\">Lua</option>\n" \
                                                       "<option value=\"Makefile\">Makefile</option>\n" \
                                                       "<option value=\"Nix\">Nix</option>\n" \
                                                       "<option value=\"Objective-C\">Objective-C</option>\n" \
                                                       "<option value=\"PHP\">PHP</option>\n" \
                                                       "<option value=\"Pascal\">Pascal</option>\n" \
                                                       "<option value=\"Perl\">Perl</option>\n" \
                                                       "<option value=\"PowerShell\">PowerShell</option>\n" \
                                                       "<option value=\"PureScript\">PureScript</option>\n" \
                                                       "<option value=\"Python\">Python</option>\n" \
                                                       "<option value=\"R\">R</option>\n" \
                                                       "<option value=\"Ruby\">Ruby</option>\n" \
                                                       "<option value=\"Rust\">Rust</option>\n" \
                                                       "<option value=\"Scala\">Scala</option>\n" \
                                                       "<option value=\"Shell\">Shell</option>\n" \
                                                       "<option value=\"Smarty\">Smarty</option>\n" \
                                                       "<option value=\"SourcePawn\">SourcePawn</option>\n" \
                                                       "<option value=\"Swift\">Swift</option>\n" \
                                                       "<option value=\"TeX\">TeX</option>\n" \
                                                       "<option value=\"TypeScript\">TypeScript</option>\n" \
                                                       "<option value=\"Vim script\">Vim script</option>\n" \
                                                       "<option value=\"VimL\">VimL</option>\n" \
                                                       "<option value=\"Visual Basic\">Visual Basic</option>\n" \
                                                       "</select>\n" \
                                                       '</form>'
    end
  end
end
