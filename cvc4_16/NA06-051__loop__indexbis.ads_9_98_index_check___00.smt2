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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant1 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-const c us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "indexbis.ads", line 2, characters 0-0
  (not
  (forall ((indexbis__result Int) (usf Int) (usf1 Int))
  (=> (dynamic_invariant1 c true false true true)
  (=> (dynamic_invariant1 s true false true true)
  (=>
  (exists ((o Bool))
  (and
  (ite (= (length s) 0) (= o true) (= o (ite (= (length c) 0) true false)))
  (exists ((spark__branch Bool))
  (and (= spark__branch o)
  (ite (= spark__branch true) (= indexbis__result 0)
  (let ((o1 (first1 s)))
  (and (in_range2 o1)
  (exists ((courant Int))
  (and (= courant o1)
  (and (dynamic_invariant courant true false true true)
  (exists ((courant1 Int))
  (and
  (and (and (<= (first1 s) courant1) (<= courant1 (last1 s)))
  (not
  (exists ((i Int))
  (and (and (<= (first1 s) i) (<= i (- courant1 1)))
  (exists ((j Int))
  (and (and (<= (first1 c) j) (<= j (last1 c)))
  (= (to_rep (select (to_array s) i)) (to_rep (select (to_array c) j)))))))))
  (and (dynamic_invariant courant1 true true true true)
  (let ((o2 (first1 c)))
  (and (in_range2 o2)
  (exists ((possible Int))
  (and (= possible o2)
  (and (dynamic_invariant possible true false true true)
  (or
  (and
  (exists ((o3 Bool))
  (exists ((o4 Bool))
  (and
  (ite (= (and (ite (<= (first1 s) courant1) true false) (ite (<= courant1 
                                                         (last1 s)) true
                                                         false)) true)
  (= o4 (ite (exists ((i Int))
             (and (and (<= (first1 s) i) (<= i (- courant1 1)))
             (exists ((j Int))
             (and (and (<= (first1 c) j) (<= j (last1 c)))
             (= (to_rep (select (to_array s) i)) (to_rep
                                                 (select (to_array c) j)))))))
        false true))
  (= o4 false))
  (ite (= o4 true)
  (= o3 (and (ite (<= (first1 c) possible) true false) (ite (<= possible 
                                                       (last1 c)) true false)))
  (= o3 false)))))
  (exists ((possible1 Int))
  (and
  (and
  (and
  (and (and (<= (first1 s) courant1) (<= courant1 (last1 s)))
  (not
  (exists ((i Int))
  (and (and (<= (first1 s) i) (<= i (- courant1 1)))
  (exists ((j Int))
  (and (and (<= (first1 c) j) (<= j (last1 c)))
  (= (to_rep (select (to_array s) i)) (to_rep (select (to_array c) j)))))))))
  (and (<= (first1 c) possible1) (<= possible1 (last1 c))))
  (not
  (exists ((j Int))
  (and (and (<= (first1 c) j) (<= j (- possible1 1)))
  (= (to_rep (select (to_array s) courant1)) (to_rep (select (to_array c) j)))))))
  (and (dynamic_invariant possible1 true true true true)
  (and (and (<= (first1 c) possible1) (<= possible1 (last1 c)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array c) possible1)) o3)
  (and (and (<= (first1 s) courant1) (<= courant1 (last1 s)))
  (exists ((o4 Int))
  (and (= (to_rep (select (to_array s) courant1)) o4)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= o4 o3) true false))
  (and (= spark__branch1 true) (= indexbis__result courant1))))))))))))))
  (exists ((spark__branch1 Bool))
  (and
  (and
  (exists ((o3 Bool))
  (exists ((o4 Bool))
  (and
  (ite (= (and (ite (<= (first1 s) courant1) true false) (ite (<= courant1 
                                                         (last1 s)) true
                                                         false)) true)
  (= o4 (ite (exists ((i Int))
             (and (and (<= (first1 s) i) (<= i (- courant1 1)))
             (exists ((j Int))
             (and (and (<= (first1 c) j) (<= j (last1 c)))
             (= (to_rep (select (to_array s) i)) (to_rep
                                                 (select (to_array c) j)))))))
        false true))
  (= o4 false))
  (ite (= o4 true)
  (= o3 (and (ite (<= (first1 c) possible) true false) (ite (<= possible 
                                                       (last1 c)) true false)))
  (= o3 false)))))
  (exists ((possible1 Int))
  (and
  (and
  (and
  (and (and (<= (first1 s) courant1) (<= courant1 (last1 s)))
  (not
  (exists ((i Int))
  (and (and (<= (first1 s) i) (<= i (- courant1 1)))
  (exists ((j Int))
  (and (and (<= (first1 c) j) (<= j (last1 c)))
  (= (to_rep (select (to_array s) i)) (to_rep (select (to_array c) j)))))))))
  (and (<= (first1 c) possible1) (<= possible1 (last1 c))))
  (not
  (exists ((j Int))
  (and (and (<= (first1 c) j) (<= j (- possible1 1)))
  (= (to_rep (select (to_array s) courant1)) (to_rep (select (to_array c) j)))))))
  (and (dynamic_invariant possible1 true true true true)
  (and (and (<= (first1 c) possible1) (<= possible1 (last1 c)))
  (exists ((o3 Int))
  (and (= (to_rep (select (to_array c) possible1)) o3)
  (and (and (<= (first1 s) courant1) (<= courant1 (last1 s)))
  (exists ((o4 Int))
  (and (= (to_rep (select (to_array s) courant1)) o4)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= o4 o3) true false))
  (and (not (= spark__branch2 true))
  (and (= spark__branch1 (ite (< possible1 (last1 c)) true false))
  (not (= spark__branch1 true))))))))))))))))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (< courant1 (last1 s)) true false))
  (and (not (= spark__branch2 true)) (= indexbis__result 0)))))))))))))))))))))))))
  (=> (not (= indexbis__result 0))
  (=>
  (= (and (ite (<= (first1 s) indexbis__result) true false) (ite (<= indexbis__result 
                                                            (last1 s)) true
                                                            false)) true)
  (=>
  (= (and (ite (<= (first1 s) usf) true false) (ite (<= usf (- indexbis__result 1))
                                               true false)) true)
  (=>
  (= (and (ite (<= (first1 c) usf1) true false) (ite (<= usf1 (last1 c)) true
                                                false)) true)
  (<= (first1 c) usf1)))))))))))
(check-sat)
(exit)
