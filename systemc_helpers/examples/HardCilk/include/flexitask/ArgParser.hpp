#ifndef HARDCILK_ARGPARSER_HPP_INCLUDED
#define HARDCILK_ARGPARSER_HPP_INCLUDED

#include <boost/program_options.hpp>

#include <ios>
#include <iostream>
#include <string>

#include <hardcilk/Context.hpp>

namespace hardcilk {

namespace detail {

using namespace boost::program_options;

/**
 * @brief Parses arguments and saves them to the Context.
 *
 */
struct ArgParser {
    ArgParser(Context& context)
        : context_ { context }
        , add_ { desc_.add_options() } {
        add_("help,h", "Help text.");
    }

    template<typename T>
    void arg(const std::string& name, T defaultValue = T(), const std::string& desc = "") {
        auto v =
            /* clang-format: off */
            value<T>()
                ->default_value(defaultValue)
                ->notifier(
                    [this, name](T const& value) {
                        context_.set<T>(name, value);
                    }
                );
        /* clang-format: on */

        add_(name.c_str(), v, desc.c_str());
    }

    bool parse(int argc, char** argv) {
        command_line_parser parser { argc, argv };
        parser.options(desc_);
        auto parsed_options = parser.run();

        variables_map vm;

        store(parsed_options, vm);

        if (vm.count("help"))
            return false;

        notify(vm);

        return true;
    }

    void helpText(std::ostream& os) {
        os << "Usage: \n"
           << desc_;
    }

private:
    options_description desc_;
    options_description_easy_init add_;
    Context& context_;
};

} /* namespace detail */

using detail::ArgParser;

} /* namespace hardcilk */

#endif /* ARGPARSER_HPP_INCLUDED */
