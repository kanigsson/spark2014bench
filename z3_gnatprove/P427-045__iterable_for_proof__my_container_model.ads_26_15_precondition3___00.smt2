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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
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

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
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

(declare-fun m_has_element ((Array Int natural) Int) Bool)

(declare-fun m_has_element__function_guard (Bool (Array Int natural)
  Int) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; m_has_element__post_axiom
  (assert true)

;; m_has_element__def_axiom
  (assert
  (forall ((c (Array Int natural)))
  (forall ((p Int))
  (! (= (= (m_has_element c p) true) (and (<= 1 p) (<= p 100))) :pattern (
  (m_has_element c p)) ))))

(declare-fun m_element ((Array Int natural) Int) Int)

(declare-fun m_element__function_guard (Int (Array Int natural) Int) Bool)

;; m_element__post_axiom
  (assert
  (forall ((c (Array Int natural)))
  (forall ((p Int))
  (! (and
     (forall ((c1 (Array Int natural)) (p1 Int))
     (m_has_element__function_guard (m_has_element c1 p1) c1 p1))
     (=>
     (and (dynamic_invariant p true true true true)
     (= (m_has_element c p) true))
     (let ((result (m_element c p)))
     (=> (m_element__function_guard result c p) (dynamic_invariant result
     true false true true))))) :pattern ((m_element c p)) ))))

;; m_element__def_axiom
  (assert
  (forall ((c (Array Int natural)))
  (forall ((p Int))
  (! (=> (dynamic_invariant p true true true true)
     (= (m_element c p) (to_rep (select c p)))) :pattern ((m_element c p)) ))))

(declare-fun get_model ((Array Int natural)) (Array Int natural))

(declare-fun get_model__function_guard ((Array Int natural)
  (Array Int natural)) Bool)

;; get_model__post_axiom
  (assert true)

;; get_model__def_axiom
  (assert
  (forall ((c (Array Int natural)))
  (! (= (get_model c) c) :pattern ((get_model c)) )))

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

(declare-datatypes ()
((my_index__ref (my_index__refqtmk (my_index__content my_index)))))
(define-fun my_index__ref_my_index__content__projection ((a my_index__ref)) my_index 
  (my_index__content a))

(declare-sort t3b 0)

(declare-fun t3bqtint (t3b) Int)

;; t3b'axiom
  (assert (forall ((i t3b)) (and (<= 1 (t3bqtint i)) (<= (t3bqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t3b t3b) Bool)

(declare-const dummy2 t3b)

(declare-datatypes () ((t3b__ref (t3b__refqtmk (t3b__content t3b)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) t3b (t3b__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 1 100)) (in_range2 temp___expr_169)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

(declare-const c (Array Int natural))

;; Assume
  (assert true)

(declare-const c1 (Array Int natural))

;; H
  (assert
  (forall ((c2 (Array Int natural)) (j Int)) (valid__function_guard
  (valid (to_rep (select c2 j))) (to_rep (select c2 j)))))

;; H
  (assert
  (forall ((c2 (Array Int natural)) (j Int)) (valid__function_guard
  (valid (to_rep (select c2 j))) (to_rep (select c2 j)))))

(declare-const i Int)

;; H
  (assert (= i 1))

;; H
  (assert
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
               (forall ((temp___259 Int))
               (=> (and (<= 1 temp___259) (<= temp___259 100))
               (=>
               (or (< 100 temp___259)
               (or (< temp___259 1) (< i1 temp___259)))
               (= (select c1 temp___259) (select c temp___259))))) (in_range3
               i1))
          true false) (ite (and (<= 1 i1) (<= i1 100)) true false)) true)
  (= i1 100)))))) (= c1 c)))

(define-fun temp___266 () (Array Int natural) (get_model c1))

;; H
  (assert (get_model__function_guard temp___266 c1))

;; H
  (assert true)

;; H
  (assert (= temp___266 c1))

(declare-const usf Int)

(define-fun o () Bool (m_has_element temp___266 usf))

;; H
  (assert (m_has_element__function_guard o temp___266 usf))

;; H
  (assert (= (= o true) (and (<= 1 usf) (<= usf 100))))

;; H
  (assert (= (and (ite (in_range1 usf) true false) o) true))

;; H
  (assert
  (forall ((temp___2661 (Array Int natural)) (usf1 Int))
  (m_has_element__function_guard (m_has_element temp___2661 usf1) temp___2661
  usf1)))

(assert
;; defqtvc
 ;; File "my_container_model.ads", line 25, characters 0-0
  (not (= (m_has_element temp___266 usf) true)))
(check-sat)
