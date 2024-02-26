#ifndef FLEXITASK_DESC_HPP_INCLUDED
#define FLEXITASK_DESC_HPP_INCLUDED

// #include <flexitask/modules/VirtualContinuationAddressServer.hpp>
// #include <flexitask/modules/VirtualStealServer.hpp>

#include <map>
#include <utility>
#include <variant>
#include <vector>

#include <sctlm/defs.hpp>

namespace flexitask {
namespace desc {

using size_type = std::uint64_t;
using width_type = unsigned;
using addr_type = std::uint64_t;

struct Axi4Config {
    width_type addr_width;
    width_type data_width;
    width_type id_width;
    width_type axlen_width;
    width_type axlock_width;
    width_type awuser_width { 0 };
    width_type aruser_width { 0 };
    width_type wuser_width { 0 };
    width_type ruser_width { 0 };
    width_type buser_width { 0 };
};

struct Axi4liteConfig {
    width_type addr_width;
    width_type data_width;
};

struct AxisConfig {
    width_type addr_width;
    width_type data_width;
    width_type user_width { 0 };
    bool no_tstrb { false };
    bool no_tlast { false };
};

struct AddressSpace {
    addr_type base { 0 };
    size_type size { 0 };
};

enum class InterfaceProtocol {
    Axi4,
    Axi4lite,
    Axis
};

struct Interface {
    std::string name;
    std::string parent;
    std::string path;

    std::string portName;

    InterfaceProtocol protocol { InterfaceProtocol::Axi4 };
    bool isSlave { false };

    std::variant<Axi4Config, Axi4liteConfig, AxisConfig> config;

    AddressSpace addressSpace { 0, 0 };
};

struct VirtualStealServer {
    std::string name;
    std::string parent;
    std::string path;

    AddressSpace addressSpace { 0, 0 };
    std::string pathInterface;

    size_type capacity { 0 };
    size_type numBytesTask { 0 };
};

struct VirtualContinuationAddressServer {
    std::string name;
    std::string parent;
    std::string path;

    AddressSpace addressSpace { 0, 0 };
    std::string pathInterface;

    size_type capacity { 0 };
    size_type numBytesCont { 0 };
};

struct ProcessingElement {
    std::string name;
    std::string parent;
    std::string path;

    std::string portName;

    std::map<std::string, Interface> interfaces;
};

struct Task {
    std::string name;
    std::string parent;
    std::string path;

    bool isRoot { false };
    bool isCont { false };

    width_type widthTask { 0 };
    width_type widthCont { 0 };
    width_type widthArg { 0 };

    size_type numProcessingElements { 0 };
    std::map<std::string, ProcessingElement> processingElements;

    size_type numVirtualStealServers { 0 };
    size_type capacityVirtualStealQueue { 0 };
    std::map<std::string, VirtualStealServer> virtualStealServers;

    size_type numVirtualContinuationServers { 0 };
    size_type capacityVirtualContinuationQueue { 0 };
    std::map<std::string, VirtualContinuationAddressServer> virtualContinuationAddressServers;

    size_type numArgRouteServers { 0 };
    size_type capacityArgRouteServers { 0 };
};

struct System {
    std::string name;
    std::string parent;
    std::string path;

    std::map<std::string, Interface> interfaces;
};

struct FlexiTaskSystem {
    std::map<std::string, Task> tasks;
    System system;
    std::vector<std::pair<std::string, std::string>> connections;

    width_type widthAddress { 0 };
    width_type widthContinuationCounter { 0 };

    std::map<std::string, std::vector<std::string>> spawnList;
    std::map<std::string, std::vector<std::string>> spawnNextList;
    std::map<std::string, std::vector<std::string>> sendArgumentList;

    addr_type managementBase { 0 };

    AddressSpace memory { 0, 0 };

    size_type interconnectMasters { 0 };
    size_type interconnectSlaves { 0 };

    bool isElaborated { false };
};

}
}

#endif /* FLEXITASK_DESC_HPP_INCLUDED */
