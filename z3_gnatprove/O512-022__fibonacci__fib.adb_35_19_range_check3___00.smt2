(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-fun fibonacci (Int) Int)

(declare-fun fibonacci__function_guard (Int Int) Bool)

;; fibonacci__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (and (dynamic_invariant n true true true true) (<= n 23))
     (let ((result (fibonacci n)))
     (=> (fibonacci__function_guard result n) (dynamic_invariant result true
     false true true)))) :pattern ((fibonacci n)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const n1 Int)

(declare-const n2 Int)

(declare-const l1 Int)

(declare-const l2 Int)

(declare-const a1 Int)

(declare-const a2 Int)

(declare-const b1 Int)

(declare-const b2 Int)

(declare-const i Int)

(declare-const copy_n1 Int)

(declare-const copy_n2 Int)

;; Assume
  (assert (dynamic_invariant n1 true false true true))

;; Assume
  (assert (dynamic_invariant n2 true false true true))

;; Assume
  (assert (dynamic_invariant l1 true false true true))

;; Assume
  (assert (dynamic_invariant l2 true false true true))

;; Assume
  (assert (and (and (= n1 n2) (= l1 l2)) (<= n1 23)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant a1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant a2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant b1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant b2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant i false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant copy_n1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant copy_n2 false false true true))

(declare-const copy_n11 Int)

;; H
  (assert (= copy_n11 n1))

(declare-const copy_n21 Int)

;; H
  (assert (= copy_n21 n2))

(declare-const a11 Int)

;; H
  (assert (= a11 1))

(declare-const a21 Int)

;; H
  (assert (= a21 1))

(declare-const b11 Int)

;; H
  (assert (= b11 1))

(declare-const b21 Int)

;; H
  (assert (= b21 1))

(declare-const i1 Int)

;; H
  (assert (= i1 2))

;; H
  (assert (< 2 n1))

(define-fun o () Int (fibonacci i1))

;; H
  (assert (fibonacci__function_guard o i1))

;; H
  (assert (dynamic_invariant o true false true true))

;; H
  (assert
  (or (not (= a11 o))
  (let ((o1 (- i1 1)))
  (and (in_range2 o1)
  (let ((o2 (fibonacci o1)))
  (and (fibonacci__function_guard o2 o1) (dynamic_invariant o2 true false
  true true)))))))

(declare-const n11 Int)

(declare-const a12 Int)

(declare-const b12 Int)

(declare-const i2 Int)

;; H
  (assert (forall ((i3 Int)) (fibonacci__function_guard (fibonacci i3) i3)))

;; H
  (assert
  (forall ((i3 Int)) (fibonacci__function_guard (fibonacci (- i3 1))
  (- i3 1))))

;; LoopInvariant
  (assert
  (and
  (and (and (= a12 (fibonacci i2)) (= b12 (fibonacci (- i2 1)))) (<= i2 23))
  (= (- (+ n11 i2) 2) copy_n11)))

;; H
  (assert
  (= (and (ite (and
               (and
               (and (dynamic_invariant i2 false true true true)
               (dynamic_invariant a12 false true true true))
               (dynamic_invariant n11 true true true true))
               (dynamic_invariant b12 false true true true))
          true false) (ite (< 2 n11) true false)) true))

(declare-const temp___197 Int)

;; H
  (assert (= temp___197 n11))

(define-fun o1 () Int (+ a12 b12))

;; Ensures
  (assert (in_range1 o1))

(declare-const a13 Int)

;; H
  (assert (= a13 o1))

(define-fun o2 () Int (- a13 b12))

;; Ensures
  (assert (in_range1 o2))

;; Ensures
  (assert (in_range2 o2))

(declare-const b13 Int)

;; H
  (assert (= b13 o2))

(define-fun o3 () Int (- n11 1))

(assert
;; defqtvc
 ;; File "fib.ads", line 12, characters 0-0
  (not (in_range2 o3)))
(check-sat)

(exit)
