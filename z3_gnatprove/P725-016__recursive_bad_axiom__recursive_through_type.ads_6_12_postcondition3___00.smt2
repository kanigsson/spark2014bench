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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun bad_f (Int) Bool)

(declare-fun bad_f__function_guard (Bool Int) Bool)

(declare-sort bad_ty 0)

(declare-fun bad_tyqtint (bad_ty) Int)

;; bad_ty'axiom
  (assert
  (forall ((i bad_ty))
  (and (<= (- 2147483648) (bad_tyqtint i)) (<= (bad_tyqtint i) 2147483647))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 2147483648) x1)
                                      (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (bad_ty bad_ty) Bool)

(declare-const dummy1 bad_ty)

(declare-datatypes ()
((bad_ty__ref (bad_ty__refqtmk (bad_ty__content bad_ty)))))
(define-fun bad_ty__ref_bad_ty__content__projection ((a bad_ty__ref)) bad_ty 
  (bad_ty__content a))

;; temp___result_162'def
  (assert
  (forall ((temp___161 Int)) (bad_f__function_guard (bad_f temp___161)
  temp___161)))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_160))
                                     (=> (= temp___do_toplevel_158 true)
                                     (=> (= temp___is_init_156 true)
                                     (= (bad_f temp___expr_160) true)))))

;; temp___result_167'def
  (assert
  (forall ((temp___166 Int)) (bad_f__function_guard (bad_f temp___166)
  temp___166)))

(define-fun dynamic_predicate ((temp___165 Int)) Bool (= (bad_f temp___165) true))

;; Assume
  (assert (dynamic_invariant x true false true true))

(declare-const recursive_through_type__bad_f__result Bool)

;; H
  (assert
  (forall ((temp___170 Int)) (bad_f__function_guard (bad_f temp___170)
  temp___170)))

;; H
  (assert
  (= recursive_through_type__bad_f__result (and (ite (in_range2 x) true
                                                false) (ite (= (bad_f x) true)
                                                       true false))))

(assert
;; defqtvc
 ;; File "recursive_through_type.ads", line 5, characters 0-0
  (not false))
(check-sat)