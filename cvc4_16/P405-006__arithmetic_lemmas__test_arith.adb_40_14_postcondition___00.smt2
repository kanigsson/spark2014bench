;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort small_natural 0)

(declare-fun small_naturalqtint (small_natural) Int)

;; small_natural'axiom
  (assert
  (forall ((i small_natural))
  (and (<= 0 (small_naturalqtint i)) (<= (small_naturalqtint i) 10000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (small_natural small_natural) Bool)

(declare-const dummy1 small_natural)

(declare-datatypes ((small_natural__ref 0))
(((small_natural__refqtmk (small_natural__content small_natural)))))
(define-fun small_natural__ref_small_natural__content__projection ((a small_natural__ref)) small_natural 
  (small_natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 10000)) (in_range1
                                     temp___expr_187)))

(assert
;; defqtvc
 ;; File "test_arith.adb", line 38, characters 0-0
  (not
  (forall ((r1 Int) (r2 Int))
  (=> (dynamic_invariant1 x1 true false true true)
  (=> (dynamic_invariant1 x2 true false true true)
  (=> (dynamic_invariant1 y true false true true)
  (=> (dynamic_invariant r1 false false true true)
  (=> (dynamic_invariant r2 false false true true)
  (=> (<= x1 x2)
  (let ((o (* x1 y)))
  (=> (in_range o)
  (forall ((r11 Int))
  (=> (= r11 o)
  (let ((o1 (* x2 y)))
  (=> (in_range o1) (forall ((r21 Int)) (=> (= r21 o1) (<= r11 r21))))))))))))))))))
(check-sat)