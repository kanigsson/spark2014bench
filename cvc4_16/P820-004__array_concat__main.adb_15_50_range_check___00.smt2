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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-fun to_string (us_image Int) us_t)

(declare-fun from_string (us_t) us_image)

;; to_string__first
  (assert
  (forall ((x us_image))
  (forall ((s Int))
  (! (= (first1 (to_string x s)) 1) :pattern ((to_string x s)) ))))

;; to_string__length
  (assert
  (forall ((x us_image))
  (forall ((s Int))
  (! (=> (<= 0 s) (<= (length1 (to_string x s)) s)) :pattern ((to_string x s)) ))))

(declare-fun concat1 ((Array Int character) Int Int (Array Int character) Int
  Int) (Array Int character))

;; concat_def
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (character Int (Array Int character) Int
  Int) (Array Int character))

;; concat_singleton_left_def
  (assert
  (forall ((a character))
  (forall ((b (Array Int character)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int character) Int Int
  character) (Array Int character))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((b character))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (character Int
  character) (Array Int character))

;; concat_singletons_def
  (assert
  (forall ((a character) (b character))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (character Int) (Array Int character))

;; singleton_def
  (assert
  (forall ((v character))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(define-fun dynamic_invariant ((temp___expr_96 us_t) (temp___is_init_92 Bool)
  (temp___skip_constant_93 Bool) (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-const vstring us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const cs (Array Int character))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const catstring us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const catstring1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const catstring2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const catstring8 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const catstring9 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const catstring10 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const catstring3 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const catstring4 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const catstring5 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const catstring6 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-sort tTcsSP1 0)

(declare-fun tTcsSP1qtint (tTcsSP1) Int)

;; tTcsSP1'axiom
  (assert
  (forall ((i tTcsSP1))
  (and (<= 1 (tTcsSP1qtint i)) (<= (tTcsSP1qtint i) 2))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tTcsSP1 tTcsSP1) Bool)

(declare-const dummy4 tTcsSP1)

(declare-datatypes ((tTcsSP1__ref 0))
(((tTcsSP1__refqtmk (tTcsSP1__content tTcsSP1)))))
(define-fun tTcsSP1__ref_tTcsSP1__content__projection ((a tTcsSP1__ref)) tTcsSP1 
  (tTcsSP1__content a))

(declare-fun main__cs__aggregate_def (Int) (Array Int character))

(declare-fun temp___String_Literal_163 (tuple0) (Array Int character))

;; temp___String_Literal_163__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_163 us_void_param) 1)) 32)
     (= (to_rep (select (temp___String_Literal_163 us_void_param) 2)) 104))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_163 us_void_param) 3)) 101)
     (= (to_rep (select (temp___String_Literal_163 us_void_param) 4)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_163 us_void_param) 5)) 108)
     (= (to_rep (select (temp___String_Literal_163 us_void_param) 6)) 111)))) :pattern (
  (temp___String_Literal_163 us_void_param)) )))

(declare-fun temp___String_Literal_166 (tuple0) (Array Int character))

;; temp___String_Literal_166__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_166 us_void_param) 1)) 32)
     (= (to_rep (select (temp___String_Literal_166 us_void_param) 2)) 104))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_166 us_void_param) 3)) 101)
     (= (to_rep (select (temp___String_Literal_166 us_void_param) 4)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_166 us_void_param) 5)) 108)
     (= (to_rep (select (temp___String_Literal_166 us_void_param) 6)) 111)))) :pattern (
  (temp___String_Literal_166 us_void_param)) )))

(declare-fun temp___String_Literal_169 (tuple0) (Array Int character))

;; temp___String_Literal_169__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_169 us_void_param) 1)) 32)
     (= (to_rep (select (temp___String_Literal_169 us_void_param) 2)) 104))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_169 us_void_param) 3)) 101)
     (= (to_rep (select (temp___String_Literal_169 us_void_param) 4)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_169 us_void_param) 5)) 108)
     (= (to_rep (select (temp___String_Literal_169 us_void_param) 6)) 111)))) :pattern (
  (temp___String_Literal_169 us_void_param)) )))

(declare-fun temp___String_Literal_172 (tuple0) (Array Int character))

;; temp___String_Literal_172__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_172 us_void_param) 1)) 104)
     (= (to_rep (select (temp___String_Literal_172 us_void_param) 2)) 101))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_172 us_void_param) 3)) 108)
     (= (to_rep (select (temp___String_Literal_172 us_void_param) 4)) 108))
     (= (to_rep (select (temp___String_Literal_172 us_void_param) 5)) 111))) :pattern (
  (temp___String_Literal_172 us_void_param)) )))

(declare-fun temp___String_Literal_174 (tuple0) (Array Int character))

;; temp___String_Literal_174__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_174 us_void_param) 1)) 104)
     (= (to_rep (select (temp___String_Literal_174 us_void_param) 2)) 101))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_174 us_void_param) 3)) 108)
     (= (to_rep (select (temp___String_Literal_174 us_void_param) 4)) 108))
     (= (to_rep (select (temp___String_Literal_174 us_void_param) 5)) 111))) :pattern (
  (temp___String_Literal_174 us_void_param)) )))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

;; vstring__def_axiom
  (assert (= vstring (to_string (attr__ATTRIBUTE_IMAGE1 10) 12)))

;; cs__def_axiom
  (assert (= cs (main__cs__aggregate_def 32)))

;; def_axiom
  (assert
  (forall ((temp___155 Int))
  (=> (dynamic_invariant3 temp___155 true true true true)
  (forall ((temp___156 Int))
  (= (to_rep (select (main__cs__aggregate_def temp___155) temp___156)) temp___155)))))

;; catstring__def_axiom
  (assert
  (= catstring (let ((temp___157 (ite (= (length1 vstring) 0)
                                 (of_array (to_array vstring)
                                 (first1 vstring) (last1 vstring))
                                 (of_array
                                 (concat1 (to_array vstring) (first1 vstring)
                                 (last1 vstring) (to_array vstring)
                                 (first1 vstring) (last1 vstring))
                                 (first1 vstring)
                                 (- (+ (first1 vstring) (+ (length
                                                           (first1 vstring)
                                                           (last1 vstring)) 
                                 (length (first1 vstring) (last1 vstring)))) 1)))))
               (ite (= (length1 temp___157) 0)
               (of_array (to_array vstring) (first1 vstring) (last1 vstring))
               (of_array
               (concat1 (to_array temp___157) (first1 temp___157)
               (last1 temp___157) (to_array vstring) (first1 vstring)
               (last1 vstring)) (first1 temp___157)
               (- (+ (first1 temp___157) (+ (length (first1 temp___157)
                                            (last1 temp___157)) (length
                                                                (first1
                                                                vstring)
                                                                (last1
                                                                vstring)))) 1))))))

;; catstring1__def_axiom
  (assert
  (= catstring1 (let ((temp___158 (ite (= (length1 vstring) 0)
                                  (of_array (to_array vstring)
                                  (first1 vstring) (last1 vstring))
                                  (of_array
                                  (concat1 (to_array vstring)
                                  (first1 vstring) (last1 vstring)
                                  (to_array vstring) (first1 vstring)
                                  (last1 vstring)) (first1 vstring)
                                  (- (+ (first1 vstring) (+ (length
                                                            (first1 vstring)
                                                            (last1 vstring)) 
                                  (length (first1 vstring) (last1 vstring)))) 1)))))
                (ite (= (length1 temp___158) 0)
                (of_array (to_array vstring) (first1 vstring)
                (last1 vstring))
                (of_array
                (concat1 (to_array temp___158) (first1 temp___158)
                (last1 temp___158) (to_array vstring) (first1 vstring)
                (last1 vstring)) (first1 temp___158)
                (- (+ (first1 temp___158) (+ (length (first1 temp___158)
                                             (last1 temp___158)) (length
                                                                 (first1
                                                                 vstring)
                                                                 (last1
                                                                 vstring)))) 1))))))

;; catstring2__def_axiom
  (assert
  (= catstring2 (let ((temp___159 (ite (= (length1 vstring) 0)
                                  (of_array (to_array vstring)
                                  (first1 vstring) (last1 vstring))
                                  (of_array
                                  (concat1 (to_array vstring)
                                  (first1 vstring) (last1 vstring)
                                  (to_array vstring) (first1 vstring)
                                  (last1 vstring)) (first1 vstring)
                                  (- (+ (first1 vstring) (+ (length
                                                            (first1 vstring)
                                                            (last1 vstring)) 
                                  (length (first1 vstring) (last1 vstring)))) 1)))))
                (ite (= (length1 vstring) 0)
                (of_array (to_array temp___159) (first1 temp___159)
                (last1 temp___159))
                (of_array
                (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                (to_array temp___159) (first1 temp___159) (last1 temp___159))
                (first1 vstring)
                (- (+ (first1 vstring) (+ (length (first1 vstring)
                                          (last1 vstring)) (length
                                                           (first1
                                                           temp___159)
                                                           (last1 temp___159)))) 1))))))

;; catstring8__def_axiom
  (assert
  (= catstring8 (let ((temp___160 (ite (= (length1 vstring) 0)
                                  (of_array cs 1 2)
                                  (of_array
                                  (concat1 (to_array vstring)
                                  (first1 vstring) (last1 vstring) cs 1 2)
                                  (first1 vstring)
                                  (- (+ (first1 vstring) (+ (length
                                                            (first1 vstring)
                                                            (last1 vstring)) 
                                  (length 1 2))) 1)))))
                (ite (= (length1 temp___160) 0)
                (of_array (to_array vstring) (first1 vstring)
                (last1 vstring))
                (of_array
                (concat1 (to_array temp___160) (first1 temp___160)
                (last1 temp___160) (to_array vstring) (first1 vstring)
                (last1 vstring)) (first1 temp___160)
                (- (+ (first1 temp___160) (+ (length (first1 temp___160)
                                             (last1 temp___160)) (length
                                                                 (first1
                                                                 vstring)
                                                                 (last1
                                                                 vstring)))) 1))))))

;; catstring9__def_axiom
  (assert
  (= catstring9 (let ((temp___161 (ite (= (length1 vstring) 0)
                                  (of_array cs 1 2)
                                  (of_array
                                  (concat1 (to_array vstring)
                                  (first1 vstring) (last1 vstring) cs 1 2)
                                  (first1 vstring)
                                  (- (+ (first1 vstring) (+ (length
                                                            (first1 vstring)
                                                            (last1 vstring)) 
                                  (length 1 2))) 1)))))
                (ite (= (length1 temp___161) 0)
                (of_array (to_array vstring) (first1 vstring)
                (last1 vstring))
                (of_array
                (concat1 (to_array temp___161) (first1 temp___161)
                (last1 temp___161) (to_array vstring) (first1 vstring)
                (last1 vstring)) (first1 temp___161)
                (- (+ (first1 temp___161) (+ (length (first1 temp___161)
                                             (last1 temp___161)) (length
                                                                 (first1
                                                                 vstring)
                                                                 (last1
                                                                 vstring)))) 1))))))

;; catstring10__def_axiom
  (assert
  (= catstring10 (let ((temp___162 (of_array
                                   (concat1 cs 1 2 (to_array vstring)
                                   (first1 vstring) (last1 vstring)) 1
                                   (- (+ 1 (+ (length 1 2) (length
                                                           (first1 vstring)
                                                           (last1 vstring)))) 1))))
                 (ite (= (length1 vstring) 0)
                 (of_array (to_array temp___162) (first1 temp___162)
                 (last1 temp___162))
                 (of_array
                 (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                 (to_array temp___162) (first1 temp___162)
                 (last1 temp___162)) (first1 vstring)
                 (- (+ (first1 vstring) (+ (length (first1 vstring)
                                           (last1 vstring)) (length
                                                            (first1
                                                            temp___162)
                                                            (last1
                                                            temp___162)))) 1))))))

;; catstring3__def_axiom
  (assert
  (= catstring3 (let ((temp___165 (let ((temp___164 (temp___String_Literal_163
                                                    Tuple0)))
                                  (ite (= (length1 vstring) 0)
                                  (of_array temp___164 1 6)
                                  (of_array
                                  (concat1 (to_array vstring)
                                  (first1 vstring) (last1 vstring) temp___164
                                  1 6) (first1 vstring)
                                  (- (+ (first1 vstring) (+ (length
                                                            (first1 vstring)
                                                            (last1 vstring)) 
                                  (length 1 6))) 1))))))
                (ite (= (length1 temp___165) 0)
                (of_array (to_array vstring) (first1 vstring)
                (last1 vstring))
                (of_array
                (concat1 (to_array temp___165) (first1 temp___165)
                (last1 temp___165) (to_array vstring) (first1 vstring)
                (last1 vstring)) (first1 temp___165)
                (- (+ (first1 temp___165) (+ (length (first1 temp___165)
                                             (last1 temp___165)) (length
                                                                 (first1
                                                                 vstring)
                                                                 (last1
                                                                 vstring)))) 1))))))

;; catstring4__def_axiom
  (assert
  (= catstring4 (let ((temp___168 (let ((temp___167 (temp___String_Literal_166
                                                    Tuple0)))
                                  (ite (= (length1 vstring) 0)
                                  (of_array temp___167 1 6)
                                  (of_array
                                  (concat1 (to_array vstring)
                                  (first1 vstring) (last1 vstring) temp___167
                                  1 6) (first1 vstring)
                                  (- (+ (first1 vstring) (+ (length
                                                            (first1 vstring)
                                                            (last1 vstring)) 
                                  (length 1 6))) 1))))))
                (ite (= (length1 temp___168) 0)
                (of_array (to_array vstring) (first1 vstring)
                (last1 vstring))
                (of_array
                (concat1 (to_array temp___168) (first1 temp___168)
                (last1 temp___168) (to_array vstring) (first1 vstring)
                (last1 vstring)) (first1 temp___168)
                (- (+ (first1 temp___168) (+ (length (first1 temp___168)
                                             (last1 temp___168)) (length
                                                                 (first1
                                                                 vstring)
                                                                 (last1
                                                                 vstring)))) 1))))))

;; catstring5__def_axiom
  (assert
  (= catstring5 (let ((temp___171 (let ((temp___170 (temp___String_Literal_169
                                                    Tuple0)))
                                  (of_array
                                  (concat1 temp___170 1 6 (to_array vstring)
                                  (first1 vstring) (last1 vstring)) 1
                                  (- (+ 1 (+ (length 1 6) (length
                                                          (first1 vstring)
                                                          (last1 vstring)))) 1)))))
                (ite (= (length1 vstring) 0)
                (of_array (to_array temp___171) (first1 temp___171)
                (last1 temp___171))
                (of_array
                (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                (to_array temp___171) (first1 temp___171) (last1 temp___171))
                (first1 vstring)
                (- (+ (first1 vstring) (+ (length (first1 vstring)
                                          (last1 vstring)) (length
                                                           (first1
                                                           temp___171)
                                                           (last1 temp___171)))) 1))))))

;; catstring6__def_axiom
  (assert
  (= catstring6 (let ((temp___176 (temp___String_Literal_174 Tuple0)))
                (let ((temp___175 (let ((temp___173 (temp___String_Literal_172
                                                    Tuple0)))
                                  (of_array
                                  (concat1 temp___173 1 5 (to_array vstring)
                                  (first1 vstring) (last1 vstring)) 1
                                  (- (+ 1 (+ (length 1 5) (length
                                                          (first1 vstring)
                                                          (last1 vstring)))) 1)))))
                (ite (= (length1 temp___175) 0) (of_array temp___176 1 5)
                (of_array
                (concat1 (to_array temp___175) (first1 temp___175)
                (last1 temp___175) temp___176 1 5) (first1 temp___175)
                (- (+ (first1 temp___175) (+ (length (first1 temp___175)
                                             (last1 temp___175)) (length 1 5))) 1)))))))

(assert
;; defqtvc
 ;; File "main.adb", line 1, characters 0-0
  (not
  (forall ((main__catstring__assume us_t) (main__catstring1__assume us_t)
  (main__catstring2__assume us_t) (temp___211 us_t))
  (=> (= (to_string (attr__ATTRIBUTE_IMAGE1 10) 12) vstring)
  (=> (dynamic_invariant vstring true false true true)
  (=> (<= (length1 vstring) 11)
  (=> (< 0 (length1 vstring))
  (=> (= (main__cs__aggregate_def 32) cs)
  (=>
  (exists ((temp___208 us_t))
  (and
  (ite (= (length1 vstring) 0)
  (= temp___208 (of_array (to_array vstring) (first1 vstring)
                (last1 vstring)))
  (let ((o (- (+ (first1 vstring) (+ (length (first1 vstring)
                                     (last1 vstring)) (length
                                                      (first1 vstring)
                                                      (last1 vstring)))) 1)))
  (and (in_range2 o)
  (= temp___208 (of_array
                (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                (to_array vstring) (first1 vstring) (last1 vstring))
                (first1 vstring) o)))))
  (ite (= (length1 temp___208) 0)
  (= main__catstring__assume (of_array (to_array vstring) (first1 vstring)
                             (last1 vstring)))
  (let ((o (- (+ (first1 temp___208) (+ (length (first1 temp___208)
                                        (last1 temp___208)) (length
                                                            (first1 vstring)
                                                            (last1 vstring)))) 1)))
  (and (in_range2 o)
  (= main__catstring__assume (of_array
                             (concat1 (to_array temp___208)
                             (first1 temp___208) (last1 temp___208)
                             (to_array vstring) (first1 vstring)
                             (last1 vstring)) (first1 temp___208) o)))))))
  (=> (= main__catstring__assume catstring)
  (=> (dynamic_invariant catstring true false true true)
  (=>
  (exists ((temp___209 us_t))
  (and
  (ite (= (length1 vstring) 0)
  (= temp___209 (of_array (to_array vstring) (first1 vstring)
                (last1 vstring)))
  (let ((o (- (+ (first1 vstring) (+ (length (first1 vstring)
                                     (last1 vstring)) (length
                                                      (first1 vstring)
                                                      (last1 vstring)))) 1)))
  (and (in_range2 o)
  (= temp___209 (of_array
                (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                (to_array vstring) (first1 vstring) (last1 vstring))
                (first1 vstring) o)))))
  (ite (= (length1 temp___209) 0)
  (= main__catstring1__assume (of_array (to_array vstring) (first1 vstring)
                              (last1 vstring)))
  (let ((o (- (+ (first1 temp___209) (+ (length (first1 temp___209)
                                        (last1 temp___209)) (length
                                                            (first1 vstring)
                                                            (last1 vstring)))) 1)))
  (and (in_range2 o)
  (= main__catstring1__assume (of_array
                              (concat1 (to_array temp___209)
                              (first1 temp___209) (last1 temp___209)
                              (to_array vstring) (first1 vstring)
                              (last1 vstring)) (first1 temp___209) o)))))))
  (=> (= main__catstring1__assume catstring1)
  (=> (dynamic_invariant catstring1 true false true true)
  (=>
  (exists ((temp___210 us_t))
  (and
  (ite (= (length1 vstring) 0)
  (= temp___210 (of_array (to_array vstring) (first1 vstring)
                (last1 vstring)))
  (let ((o (- (+ (first1 vstring) (+ (length (first1 vstring)
                                     (last1 vstring)) (length
                                                      (first1 vstring)
                                                      (last1 vstring)))) 1)))
  (and (in_range2 o)
  (= temp___210 (of_array
                (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                (to_array vstring) (first1 vstring) (last1 vstring))
                (first1 vstring) o)))))
  (ite (= (length1 vstring) 0)
  (= main__catstring2__assume (of_array (to_array temp___210)
                              (first1 temp___210) (last1 temp___210)))
  (let ((o (- (+ (first1 vstring) (+ (length (first1 vstring)
                                     (last1 vstring)) (length
                                                      (first1 temp___210)
                                                      (last1 temp___210)))) 1)))
  (and (in_range2 o)
  (= main__catstring2__assume (of_array
                              (concat1 (to_array vstring) (first1 vstring)
                              (last1 vstring) (to_array temp___210)
                              (first1 temp___210) (last1 temp___210))
                              (first1 vstring) o)))))))
  (=> (= main__catstring2__assume catstring2)
  (=> (dynamic_invariant catstring2 true false true true)
  (=>
  (ite (= (length1 vstring) 0) (= temp___211 (of_array cs 1 2))
  (let ((o (- (+ (first1 vstring) (+ (length (first1 vstring)
                                     (last1 vstring)) (length 1 2))) 1)))
  (and (in_range2 o)
  (= temp___211 (of_array
                (concat1 (to_array vstring) (first1 vstring) (last1 vstring)
                cs 1 2) (first1 vstring) o)))))
  (=> (not (= (length1 temp___211) 0)) (in_range2
  (- (+ (first1 temp___211) (+ (length (first1 temp___211)
                               (last1 temp___211)) (length (first1 vstring)
                                                   (last1 vstring)))) 1)))))))))))))))))))))
(check-sat)
(exit)
