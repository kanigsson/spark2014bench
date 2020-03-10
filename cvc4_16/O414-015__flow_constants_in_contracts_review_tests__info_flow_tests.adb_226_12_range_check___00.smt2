(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort tt2B 0)

(declare-fun tt2Bqtint (tt2B) Int)

;; tt2B'axiom
  (assert
  (forall ((i tt2B))
  (and (<= (- 2147483648) (tt2Bqtint i)) (<= (tt2Bqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tt2B tt2B) Bool)

(declare-const dummy1 tt2B)

(declare-datatypes ((tt2B__ref 0))
(((tt2B__refqtmk (tt2B__content tt2B)))))
(define-fun tt2B__ref_tt2B__content__4__projection ((a1 tt2B__ref)) tt2B 
  (tt2B__content a1))

(define-fun to_rep ((x tt2B)) Int (tt2Bqtint x))

(declare-fun of_rep (Int) tt2B)

;; inversion_axiom
  (assert
  (forall ((x tt2B)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tt2B)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const first Int)

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tt2B tt2B) Bool)

(declare-const dummy2 tt2B)

(declare-datatypes ((t2__ref 0))
(((t2__refqtmk (t2__content tt2B)))))
(define-fun t2__ref_t2__content__4__projection ((a1 t2__ref)) tt2B (t2__content
                                                                   a1))

(declare-const last1 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tt2B tt2B) Bool)

(declare-const dummy3 tt2B)

(declare-datatypes ((t3__ref 0))
(((t3__refqtmk (t3__content tt2B)))))
(define-fun t3__ref_t3__content__projection ((a1 t3__ref)) tt2B (t3__content
                                                                a1))

(declare-sort tt4B 0)

(declare-fun tt4Bqtint (tt4B) Int)

;; tt4B'axiom
  (assert
  (forall ((i tt4B))
  (and (<= (- 2147483648) (tt4Bqtint i)) (<= (tt4Bqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tt4B tt4B) Bool)

(declare-const dummy4 tt4B)

(declare-datatypes ((tt4B__ref 0))
(((tt4B__refqtmk (tt4B__content tt4B)))))
(define-fun tt4B__ref_tt4B__content__projection ((a1 tt4B__ref)) tt4B 
  (tt4B__content a1))

(define-fun to_rep1 ((x tt4B)) Int (tt4Bqtint x))

(declare-fun of_rep1 (Int) tt4B)

;; inversion_axiom
  (assert
  (forall ((x tt4B)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tt4B)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-const last2 Int)

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tt4B tt4B) Bool)

(declare-const dummy5 tt4B)

(declare-datatypes ((t4__ref 0))
(((t4__refqtmk (t4__content tt4B)))))
(define-fun t4__ref_t4__content__projection ((a1 t4__ref)) tt4B (t4__content
                                                                a1))

(define-fun dynamic_invariant1 ((temp___expr_260 Int)
  (temp___is_init_256 Bool) (temp___skip_constant_257 Bool)
  (temp___do_toplevel_258 Bool)
  (temp___do_typ_inv_259 Bool)) Bool (=>
                                     (or (= temp___is_init_256 true)
                                     (<= first last)) (dynamic_property 
                                     first last temp___expr_260)))

;; first__def_axiom
  (assert (= first a))

;; last__def_axiom
  (assert (= last b))

(define-fun dynamic_invariant2 ((temp___expr_267 Int)
  (temp___is_init_263 Bool) (temp___skip_constant_264 Bool)
  (temp___do_toplevel_265 Bool)
  (temp___do_typ_inv_266 Bool)) Bool (=>
                                     (or (= temp___is_init_263 true)
                                     (<= 0 last1)) (dynamic_property1 0 
                                     last1 temp___expr_267)))

;; last__def_axiom
  (assert (= last1 last))

(define-fun dynamic_invariant3 ((temp___expr_274 Int)
  (temp___is_init_270 Bool) (temp___skip_constant_271 Bool)
  (temp___do_toplevel_272 Bool)
  (temp___do_typ_inv_273 Bool)) Bool (=>
                                     (or (= temp___is_init_270 true)
                                     (<= 0 last2)) (dynamic_property2 0 
                                     last2 temp___expr_274)))

;; last__def_axiom
  (assert (= last2 last1))

(assert
;; defqtvc
 ;; File "info_flow_tests.adb", line 212, characters 0-0
  (not
  (forall ((c Int) (d Int) (e Int))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (dynamic_invariant c false false true true)
  (=> (dynamic_invariant d false false true true)
  (=> (dynamic_invariant e false false true true) (=> (<= 0 last1) (<= 0 0))))))))))
(check-sat)
(exit)
