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

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-fun to_rep1 (character) Int)

(declare-fun of_rep1 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
                           (= (to_rep1 (select a temp___idx_91)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
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

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-datatypes ((text__ref 0))
(((text__refqtmk (text__content us_t)))))
(define-fun text__ref_text__content__projection ((a text__ref)) us_t 
  (text__content a))

(declare-const needle us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int positive))))))
(declare-fun slide1 ((Array Int positive) Int Int) (Array Int positive))

;; slide_eq
  (assert
  (forall ((a (Array Int positive)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int positive)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int positive)) (a__first Int) (a__last Int)
  (b (Array Int positive)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_158 Int))
                           (=>
                           (and (<= a__first temp___idx_158)
                           (<= temp___idx_158 a__last))
                           (= (to_rep (select a temp___idx_158)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_158)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int positive)) (b (Array Int positive)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_158 Int))
  (=> (and (<= a__first temp___idx_158) (<= temp___idx_158 a__last))
  (= (to_rep (select a temp___idx_158)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_158)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((t25b__ref 0))
(((t25b__refqtmk (t25b__content integer)))))
(define-fun t25b__ref_t25b__content__projection ((a t25b__ref)) integer 
  (t25b__content a))

(define-fun dynamic_invariant ((temp___expr_165 us_t)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_162 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_165)
                                     (last1 temp___expr_165)))
                                     (=> (= temp___do_toplevel_163 true)
                                     (=> (= temp___is_init_161 true)
                                     (= (first1 temp___expr_165) 1)))))

(define-fun dynamic_predicate ((temp___168 us_t)) Bool (= (first1 temp___168) 1))

(declare-fun temp_____aggregate_def_361 (Int) (Array Int positive))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

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

;; def_axiom
  (assert
  (forall ((temp___363 Int))
  (=> (dynamic_invariant1 temp___363 true true true true)
  (forall ((temp___364 Int))
  (= (to_rep (select (temp_____aggregate_def_361 temp___363) temp___364)) temp___363)))))

(assert
;; defqtvc
 ;; File "string_search.ads", line 45, characters 0-0
  (not
  (=> (dynamic_invariant needle true false true true)
  (=> (< (length needle) 2147483647)
  (let ((o (length needle)))
  (=> (in_range1 o)
  (let ((o1 (+ o 1)))
  (=> (in_range1 o1)
  (forall ((bad_shift (Array Int positive)))
  (=> (= bad_shift (temp_____aggregate_def_361 o1))
  (forall ((bad_shift1 (Array Int positive)))
  (=>
  (let ((temp___365 (first1 needle)))
  (let ((temp___366 (last1 needle)))
  (exists ((j Int))
  (and (= j temp___365)
  (ite (= (and (ite (<= temp___365 j) true false) (ite (<= j temp___366) true
                                                  false)) true)
  (let ((o2 (length needle)))
  (and (in_range1 o2)
  (let ((o3 (- o2 j)))
  (and (in_range1 o3)
  (let ((o4 (+ o3 1)))
  (and (in_range1 o4)
  (and (in_range2 o4)
  (exists ((o5 positive))
  (and (= (to_rep o5) o4)
  (exists ((o6 Int))
  (and (= (to_rep1 (select (to_array needle) j)) o6)
  (exists ((bad_shift2 (Array Int positive)))
  (and (= bad_shift2 (store bad_shift o6 o5))
  (exists ((j1 Int))
  (and
  (and
  (forall ((c Int))
  (=> (and (<= 0 c) (<= c 255))
  (let ((temp___375 (to_rep (select bad_shift1 c))))
  (and (<= 1 temp___375) (<= temp___375 (+ (length needle) 1))))))
  (forall ((c Int))
  (=> (and (<= 0 c) (<= c 255))
  (ite (= (to_rep (select bad_shift1 c)) (+ (length needle) 1))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k j1))
  (not (= c (to_rep1 (select (to_array needle) k))))))
  (and
  (= (to_rep1
     (select (to_array needle) (+ (- (length needle) (to_rep
                                                     (select bad_shift1 c))) 1))) c)
  (forall ((k Int))
  (=>
  (and (<= (+ (- (length needle) (to_rep (select bad_shift1 c))) 2) k)
  (<= k j1)) (not (= (to_rep1 (select (to_array needle) k)) c)))))))))
  (and
  (= (and (ite (dynamic_property1 (first1 needle) (last1 needle) j1) true
          false) (ite (and (<= (first1 needle) j1) (<= j1 (last1 needle)))
                 true false)) true)
  (= j1 temp___366))))))))))))))))) (= bad_shift1 bad_shift))))))
  (=>
  (forall ((c Int))
  (=> (and (<= 0 c) (<= c 255))
  (let ((temp___378 (to_rep (select bad_shift1 c))))
  (and (<= 1 temp___378) (<= temp___378 (+ (length needle) 1))))))
  (forall ((usf Int))
  (=>
  (= (and (ite (<= 0 usf) true false) (ite (<= usf 255) true false)) true)
  (let ((o2 (length needle)))
  (=> (in_range1 o2)
  (let ((o3 (+ o2 1)))
  (=> (in_range1 o3)
  (forall ((o4 Int))
  (=> (= (to_rep (select bad_shift1 usf)) o4)
  (=> (not (= o4 o3))
  (forall ((o5 Int))
  (=> (= (to_rep (select bad_shift1 usf)) o5)
  (let ((o6 (length needle)))
  (=> (in_range1 o6) (in_range1 (+ (- o6 o5) 2))))))))))))))))))))))))))))
(check-sat)
(exit)
