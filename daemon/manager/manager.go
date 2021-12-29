/*
 * Copyright (c) 2019 Huawei Technologies Co., Ltd.
 * MeshAccelerating is licensed under the Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *     http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR
 * PURPOSE.
 * See the Mulan PSL v2 for more details.
 * Author: LemmyHuang
 * Create: 2021-10-09
 */

package manager

import (
	"openeuler.io/mesh/cmd/command"
	"openeuler.io/mesh/pkg/bpf"
	"openeuler.io/mesh/pkg/controller"
	"openeuler.io/mesh/pkg/logger"
	"openeuler.io/mesh/pkg/option"
	"os"
	"os/signal"
	"syscall"
)

const (
	pkgSubsys = "manager"
)

var (
	log = logger.DefaultLogger.WithField(logger.LogSubsys, pkgSubsys)
	bpfObj bpf.BpfObject
)

func Execute() {
	var err error

	option.InitializeDaemonConfig()

	err = bpf.Start()
	if err != nil {
		log.Error(err)
		return
	}
	defer bpf.Detach()

	err = controller.Start()
	if err != nil {
		log.Error(err)
		return
	}
	defer controller.Quit()

	command.Start()

	setupCloseHandler()
	return
}

func setupCloseHandler() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGINT, syscall.SIGKILL, syscall.SIGTERM, syscall.SIGQUIT)

	<-ch
	controller.Quit()
	bpf.Detach()

	os.Exit(1)
}