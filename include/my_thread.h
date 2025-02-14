#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <iostream>
#include <thread>
#include <atomic>
#include <chrono>
#include <condition_variable>

class MyThread {
protected:
    std::atomic<bool> stop_flag_;
    std::atomic<bool> suspend_flag_;
    std::condition_variable cv_;
    std::mutex cv_mtx_;
    std::thread worker_;

public:
    MyThread();
    virtual ~MyThread();

    void start();
    void stop();
    bool is_stopped() const;
    void suspend();
    bool is_suspended() const;
    void resume();

    virtual void run() = 0;
};

#endif // MYTHREAD_H
