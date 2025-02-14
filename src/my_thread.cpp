#include "my_thread.h"

MyThread::MyThread() : stop_flag_(false), suspend_flag_(false) {}

MyThread::~MyThread() {
    stop();
    if (worker_.joinable()) {
        worker_.join();
    }
}

void MyThread::start() {
    worker_ = std::thread(&MyThread::run, this);
}

void MyThread::stop() {
    stop_flag_.store(true);
    resume();  // 确保挂起时也能退出
}

bool MyThread::is_stopped() const {
    return stop_flag_.load();
}

void MyThread::suspend() {
    suspend_flag_.store(true);
    std::cout << "Thread suspended." << std::endl;
}

bool MyThread::is_suspended() const {
    return suspend_flag_.load();
}

void MyThread::resume() {
    suspend_flag_.store(false);
    cv_.notify_all();  // 唤醒线程
    std::cout << "Thread resumed." << std::endl;
}

class CustomThread : public MyThread {
    public:
        void run() override {
            std::cout << "Thread started." << std::endl;
            while (!is_stopped()) {
                // 处理挂起逻辑
                std::unique_lock<std::mutex> lock(cv_mtx_);
                cv_.wait(lock, [this] { return !is_suspended() || is_stopped(); });

                if (is_stopped()) break;

                std::cout << "Thread is running custom logic." << std::endl;
                std::this_thread::sleep_for(std::chrono::seconds(1));
            }
            std::cout << "Thread stopped." << std::endl;
        }
    };

int main() {
    CustomThread thread;
    thread.start();

    std::this_thread::sleep_for(std::chrono::seconds(5));

    std::cout << "Stopping thread..." << std::endl;
    thread.suspend();
    std::this_thread::sleep_for(std::chrono::seconds(5));
    thread.resume();
    std::this_thread::sleep_for(std::chrono::seconds(5));
    thread.stop();
    
    return 0;
}
