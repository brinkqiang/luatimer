
// Copyright (c) 2018 brinkqiang (brink.qiang@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#include "luatimer.h"
#include<iostream>

Cluatimer::Cluatimer(sol::this_state L)
    : m_oState(L), m_bStop(false)
{

}

void Cluatimer::settimer(uint64_t qwIDEvent,  uint64_t qwElapse,
                         sol::main_protected_function f, sol::variadic_args va )
{
    SetLTimer(qwIDEvent, qwElapse, f, va );
}

void Cluatimer::killtimer(uint64_t qwIDEvent)
{
    KillTimer(qwIDEvent);
}

void Cluatimer::killall()
{
    KillTimer();
}

void Cluatimer::stop()
{
    m_bStop = true;

    KillTimer();
}

void Cluatimer::run()
{
    int nEvent = 0;
    bool bBusy = false;

    while (!m_bStop)
    {
        bBusy = false;

        if (CDMTimerModule::Instance()->Run())
        {
            bBusy = true;
        }

        if (!bBusy)
        {
            SleepMs(1);
        }
    }

    CDMTimerModule::Instance()->Run();
}

int Cluatimer::poll()
{
    return CDMTimerModule::Instance()->Run();
}
