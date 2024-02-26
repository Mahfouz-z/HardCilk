#ifndef GRAPH_HPP_INCLUDED
#define GRAPH_HPP_INCLUDED

#include <ostream>
#include <sstream>
#include <string>
#include <vector>
#include <stdexcept>

#include <fmt/format.h>

#include <flexitask/ArgParser.hpp>

namespace flexitask::graph {

/**
 * @brief node is not stored in the system memory.
 * purely simulated and for functionality.
 *
 */
struct node {
    std::string name;
    bool visited = false;
    std::vector<node*> adj;

    std::string str() const;
};

inline std::ostream& operator<<(std::ostream& os, node const& n) {
    os << fmt::format("node(name = {}, visited = {})", n.name, n.visited);
    return os;
}

inline std::string node::str() const {
    std::ostringstream oss;
    oss << *this;
    return oss.str();
}

struct Graph {
    Graph(unsigned breadth = 8192, unsigned depth = 1) {
        if (depth < 1)
            throw std::runtime_error("Graph::graph: depth must be >= 1.");

        // add a single root node
        root_ = new_node();

        // and so many children nodes
        for (unsigned i = 0; i < breadth; ++i) {
            auto n = new_node(fmt::format("node_{}", i));
            root_->adj.push_back(n);

            for (unsigned j = 0; j < depth - 1; ++j) {
                auto nn = new_node(fmt::format("node_{}_{}", i, j));
                n->adj.emplace_back(nn);
            }
        }
    }

    /** not copyable */
    Graph(const Graph&) = delete;

    /** not copyable */
    Graph& operator=(const Graph&) = delete;

    /** not movable */
    Graph(Graph&&) = delete;

    /** not movable */
    Graph& operator=(Graph&&) = delete;

    ~Graph() = default;

    node* root() noexcept {
        return root_;
    }

    node const* root() const noexcept {
        return root_;
    }

    auto size() {
        return nodes_.size();
    }

    static void registerArgParser(
        const std::string& prefix,
        ArgParser& argParser,
        unsigned defaultBreadth = 1024,
        unsigned defaultDepth = 1) {
        argParser.arg<unsigned>(fmt::format("{}.breadth", prefix), 1024);
        argParser.arg<unsigned>(fmt::format("{}.depth", prefix), 1);
    }

    static std::unique_ptr<Graph> fromContext(const std::string& prefix, Context const& context) {
        auto breadth = context.get<unsigned>(fmt::format("{}.breadth", prefix));
        auto depth = context.get<unsigned>(fmt::format("{}.depth", prefix));

        return std::make_unique<Graph>(breadth, depth);
    }

private:
    std::vector<std::unique_ptr<node>> nodes_;
    node* root_ = nullptr;
    unsigned int last_idx_ = 0;

    node* new_node(const std::string& str) {
        last_idx_++;

        auto n_ptr = std::make_unique<node>();

        n_ptr->name = str;

        auto result = n_ptr.get();

        nodes_.emplace_back(std::move(n_ptr));
        return result;
    }

    node* new_node() {
        return new_node(fmt::format("node_{}", last_idx_));
    }
};

} /* namespace flexitask::graph */

#endif /* GRAPH_HPP_INCLUDED */
