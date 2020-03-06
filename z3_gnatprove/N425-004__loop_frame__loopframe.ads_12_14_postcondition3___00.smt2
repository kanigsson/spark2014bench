;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort idx 0)

(declare-fun idxqtint (idx) Int)

;; idx'axiom
  (assert (forall ((i idx)) (and (<= 0 (idxqtint i)) (<= (idxqtint i) 5))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (idx idx) Bool)

(declare-const dummy idx)

(declare-datatypes () ((idx__ref (idx__refqtmk (idx__content idx)))))
(define-fun idx__ref_idx__content__projection ((a idx__ref)) idx (idx__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 5)) (in_range1 temp___expr_160)))

(declare-sort valid_idx 0)

(declare-fun valid_idxqtint (valid_idx) Int)

;; valid_idx'axiom
  (assert
  (forall ((i valid_idx))
  (and (<= 1 (valid_idxqtint i)) (<= (valid_idxqtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (valid_idx valid_idx) Bool)

(declare-const dummy1 valid_idx)

(declare-datatypes ()
((valid_idx__ref (valid_idx__refqtmk (valid_idx__content valid_idx)))))
(define-fun valid_idx__ref_valid_idx__content__projection ((a valid_idx__ref)) valid_idx 
  (valid_idx__content a))

(define-fun dynamic_invariant1 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 1 5)) (in_range2 temp___expr_167)))

(declare-const a (Array Int Bool))

;; Assume
  (assert true)

(declare-const v Int)

;; H
  (assert (= v 0))

;; Assume
  (assert (dynamic_invariant v true false true true))

(declare-const v1 Int)

;; H
  (assert
  (or
  (and
  (exists ((x Int))
  (and (= x 1)
  (exists ((spark__branch Bool))
  (and (= spark__branch (select a x))
  (and (not (= spark__branch true))
  (exists ((x1 Int))
  (and (= x1 2)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (select a x1))
  (and (not (= spark__branch1 true))
  (exists ((x2 Int))
  (and (= x2 3)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (select a x2))
  (and (not (= spark__branch2 true))
  (exists ((x3 Int))
  (and (= x3 4)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (select a x3))
  (and (not (= spark__branch3 true))
  (exists ((x4 Int))
  (and (= x4 5)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (select a x4)) (not (= spark__branch4 true))))))))))))))))))))))))))
  (= v1 v))
  (exists ((x Int))
  (and (= x 1)
  (exists ((spark__branch Bool))
  (and (= spark__branch (select a x))
  (ite (= spark__branch true) (= v1 x)
  (exists ((x1 Int))
  (and (= x1 2)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (select a x1))
  (ite (= spark__branch1 true) (= v1 x1)
  (exists ((x2 Int))
  (and (= x2 3)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (select a x2))
  (ite (= spark__branch2 true) (= v1 x2)
  (exists ((x3 Int))
  (and (= x3 4)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (select a x3))
  (ite (= spark__branch3 true) (= v1 x3)
  (exists ((x4 Int))
  (and (= x4 5)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (select a x4))
  (and (= spark__branch4 true) (= v1 x4))))))))))))))))))))))))))))

(declare-const loopframe__get__result Int)

;; H
  (assert (= loopframe__get__result v1))

;; H
  (assert (not (= loopframe__get__result 0)))

(assert
;; defqtvc
 ;; File "loopframe.ads", line 11, characters 0-0
  (not (= (select a loopframe__get__result) true)))
(check-sat)