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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-fun mem ((Array Int natural) Int) Bool)

(declare-fun mem__function_guard (Bool (Array Int natural) Int) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; mem__post_axiom
  (assert true)

;; mem__def_axiom
  (assert
  (forall ((c (Array Int natural)))
  (forall ((e Int))
  (! (= (= (mem c e) true)
     (exists ((i Int))
     (and (and (<= 1 i) (<= i 100)) (= (to_rep (select c i)) e)))) :pattern (
  (mem c e)) ))))

(declare-fun valid (Int) Bool)

(declare-fun valid__function_guard (Bool Int) Bool)

;; valid__post_axiom
  (assert true)

;; valid__def_axiom
  (assert
  (forall ((e Int)) (! (= (= (valid e) true) (< 0 e)) :pattern ((valid e)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort my_index 0)

(declare-fun my_indexqtint (my_index) Int)

;; my_index'axiom
  (assert
  (forall ((i my_index))
  (and (<= 1 (my_indexqtint i)) (<= (my_indexqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (my_index my_index) Bool)

(declare-const dummy1 my_index)

(declare-datatypes ((my_index__ref 0))
(((my_index__refqtmk (my_index__content my_index)))))
(define-fun my_index__ref_my_index__content__projection ((a my_index__ref)) my_index 
  (my_index__content a))

(declare-sort t7b 0)

(declare-fun t7bqtint (t7b) Int)

;; t7b'axiom
  (assert (forall ((i t7b)) (and (<= 1 (t7bqtint i)) (<= (t7bqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t7b t7b) Bool)

(declare-const dummy2 t7b)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content t7b)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) t7b (t7b__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 100)) (in_range2 temp___expr_165)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "my_container_contains.ads", line 19, characters 0-0
  (not
  (forall ((c (Array Int natural)) (c1 (Array Int natural)) (e Int))
  (=>
  (forall ((c2 (Array Int natural)) (j Int)) (valid__function_guard
  (valid (to_rep (select c2 j))) (to_rep (select c2 j))))
  (=>
  (forall ((c2 (Array Int natural)) (j Int)) (valid__function_guard
  (valid (to_rep (select c2 j))) (to_rep (select c2 j))))
  (=>
  (exists ((i Int))
  (and (= i 1)
  (ite (= (and (ite (<= 1 i) true false) (ite (<= i 100) true false)) true)
  (exists ((spark__branch Bool) (c2 (Array Int natural)))
  (and
  (exists ((o Int))
  (and (= (to_rep (select c i)) o)
  (and (= spark__branch (ite (= o 0) true false))
  (ite (= spark__branch true) (= c2 (store c i rliteral)) (= c2 c)))))
  (exists ((i1 Int))
  (and
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j i1)) (= (valid (to_rep (select c1 j))) true)))
  (and
  (= (and (ite (and
               (forall ((temp___223 Int))
               (=> (and (<= 1 temp___223) (<= temp___223 100))
               (=>
               (or (< 100 temp___223)
               (or (< temp___223 1) (< i1 temp___223)))
               (= (select c1 temp___223) (select c temp___223))))) (in_range3
               i1))
          true false) (ite (and (<= 1 i1) (<= i1 100)) true false)) true)
  (= i1 100)))))) (= c1 c))))
  (=> (in_range1 e)
  (=>
  (forall ((c2 (Array Int natural)) (e1 Int)) (mem__function_guard
  (mem c2 e1) c2 e1))
  (=> (= (mem c1 e) true)
  (=> (forall ((e1 Int)) (valid__function_guard (valid e1) e1))
  (= (valid e) true)))))))))))
(check-sat)
(exit)
