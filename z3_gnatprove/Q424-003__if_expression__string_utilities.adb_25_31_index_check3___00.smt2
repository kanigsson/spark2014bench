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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
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
  (forall ((x character)) (! (in_range4 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
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

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant2 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-const s1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tseq_lengthB 0)

(declare-fun tseq_lengthBqtint (tseq_lengthB) Int)

;; tseq_lengthB'axiom
  (assert
  (forall ((i tseq_lengthB))
  (and (<= (- 2147483648) (tseq_lengthBqtint i))
  (<= (tseq_lengthBqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tseq_lengthB tseq_lengthB) Bool)

(declare-const dummy5 tseq_lengthB)

(declare-datatypes ()
((tseq_lengthB__ref
 (tseq_lengthB__refqtmk (tseq_lengthB__content tseq_lengthB)))))
(define-fun tseq_lengthB__ref_tseq_lengthB__content__projection ((a tseq_lengthB__ref)) tseq_lengthB 
  (tseq_lengthB__content a))

(define-fun to_rep2 ((x tseq_lengthB)) Int (tseq_lengthBqtint x))

(declare-fun of_rep2 (Int) tseq_lengthB)

;; inversion_axiom
  (assert
  (forall ((x tseq_lengthB))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x tseq_lengthB)) (! (in_range5
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-const last2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (tseq_lengthB tseq_lengthB) Bool)

(declare-const dummy6 tseq_lengthB)

(declare-datatypes ()
((seq_length__ref (seq_length__refqtmk (seq_length__content tseq_lengthB)))))
(define-fun seq_length__ref_seq_length__content__projection ((a seq_length__ref)) tseq_lengthB 
  (seq_length__content a))

(declare-sort map1 0)

(declare-datatypes () ((map__ref1 (map__refqtmk1 (map__content1 map1)))))
(declare-fun get (map1 Int Int) tseq_lengthB)

(declare-fun set (map1 Int Int tseq_lengthB) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a tseq_lengthB))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a tseq_lengthB))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide1 (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide1 a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide1 a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq2 ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_159 Int)
                             (temp___idx_160 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_159)
                             (<= temp___idx_159 a__last))
                             (and (<= a__first_2 temp___idx_160)
                             (<= temp___idx_160 a__last_2)))
                             (= (to_rep2
                                (get a temp___idx_159 temp___idx_160)) 
                             (to_rep2
                             (get b (+ (- b__first a__first) temp___idx_159)
                             (+ (- b__first_2 a__first_2) temp___idx_160)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq2 b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_159 Int) (temp___idx_160 Int))
  (=>
  (and (and (<= a__first temp___idx_159) (<= temp___idx_159 a__last))
  (and (<= a__first_2 temp___idx_160) (<= temp___idx_160 a__last_2)))
  (= (to_rep2 (get a temp___idx_159 temp___idx_160)) (to_rep2
                                                     (get b
                                                     (+ (- b__first a__first) temp___idx_159)
                                                     (+ (- b__first_2 a__first_2) temp___idx_160)))))))))))

(declare-const lengths__first integer)

(declare-const lengths__last integer)

(declare-const lengths__first_2 integer)

(declare-const lengths__last_2 integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const first2 Int)

(declare-const last3 Int)

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (integer integer) Bool)

(declare-const dummy7 integer)

(declare-datatypes ()
((s1_index__ref (s1_index__refqtmk (s1_index__content integer)))))
(define-fun s1_index__ref_s1_index__content__projection ((a s1_index__ref)) integer 
  (s1_index__content a))

(declare-const first3 Int)

(declare-const last4 Int)

(define-fun dynamic_property3 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ()
((s2_index__ref (s2_index__refqtmk (s2_index__content integer)))))
(define-fun s2_index__ref_s2_index__content__projection ((a s2_index__ref)) integer 
  (s2_index__content a))

(declare-sort t1 0)

(declare-fun first4 (t1) integer)

(declare-fun last5 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first4 (mk1 f l))) f)
     (= (to_rep1 (last5 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property4 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property2 range_first range_last low)
                   (dynamic_property2 range_first range_last high))))))

(declare-sort t2 0)

(declare-fun first5 (t2) integer)

(declare-fun last6 (t2) integer)

(declare-fun mk2 (Int Int) t2)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first5 (mk2 f l))) f)
     (= (to_rep1 (last6 (mk2 f l))) l)))) :pattern ((mk2 f l)) )))

(define-fun dynamic_property5 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property3 range_first range_last low)
                   (dynamic_property3 range_first range_last high))))))

(declare-datatypes () ((us_t1 (us_tqtmk1 (elts1 map1)(rt1 t1)(rt_2 t2)))))
(define-fun to_array1 ((a us_t1)) map1 (elts1 a))

(define-fun of_array1 ((a map1) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t1 (us_tqtmk1 a (mk1 f l) (mk2 f2 l2)))

(define-fun first6 ((a us_t1)) Int (to_rep1 (first4 (rt1 a))))

(define-fun last7 ((a us_t1)) Int (to_rep1 (last5 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first6 a) (last7 a))
                                    (+ (- (last7 a) (first6 a)) 1) 0))

(define-fun first_2 ((a us_t1)) Int (to_rep1 (first5 (rt_2 a))))

(define-fun last_2 ((a us_t1)) Int (to_rep1 (last6 (rt_2 a))))

(define-fun length_2 ((a us_t1)) Int (ite (<= (first_2 a) (last_2 a))
                                     (+ (- (last_2 a) (first_2 a)) 1) 0))

(define-fun dynamic_property6 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property4 range_first1 range_last1 f1 l1)
                 (dynamic_property5 range_first2 range_last2 f2 l2)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep1 (first4 (rt1 x)))
                  (to_rep1 (last5 (rt1 x))) (to_rep1 (first5 (rt_2 x)))
                  (to_rep1 (last6 (rt_2 x))) (elts1 y)
                  (to_rep1 (first4 (rt1 y))) (to_rep1 (last5 (rt1 y)))
                  (to_rep1 (first5 (rt_2 y))) (to_rep1 (last6 (rt_2 y)))))

(declare-fun user_eq9 (us_t1 us_t1) Bool)

(declare-const dummy9 us_t1)

(declare-datatypes ()
((tlengthsB__ref (tlengthsB__refqtmk (tlengthsB__content us_t1)))))
(define-fun tlengthsB__ref_tlengthsB__content__projection ((a tlengthsB__ref)) us_t1 
  (tlengthsB__content a))

(declare-datatypes ()
((tlengthsT__ref (tlengthsT__refqtmk (tlengthsT__content us_t1)))))
(define-fun tlengthsT__ref_tlengthsT__content__projection ((a tlengthsT__ref)) us_t1 
  (tlengthsT__content a))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_242 Int)
  (temp___is_init_238 Bool) (temp___skip_constant_239 Bool)
  (temp___do_toplevel_240 Bool)
  (temp___do_typ_inv_241 Bool)) Bool (=>
                                     (or (= temp___is_init_238 true)
                                     (<= first2 last3)) (dynamic_property2
                                     first2 last3 temp___expr_242)))

;; first__def_axiom
  (assert (= first2 (first1 s1)))

;; last__def_axiom
  (assert (= last3 (last1 s1)))

(define-fun dynamic_invariant6 ((temp___expr_249 Int)
  (temp___is_init_245 Bool) (temp___skip_constant_246 Bool)
  (temp___do_toplevel_247 Bool)
  (temp___do_typ_inv_248 Bool)) Bool (=>
                                     (or (= temp___is_init_245 true)
                                     (<= first3 last4)) (dynamic_property3
                                     first3 last4 temp___expr_249)))

;; first__def_axiom
  (assert (= first3 (first1 s2)))

;; last__def_axiom
  (assert (= last4 (last1 s2)))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(define-fun dynamic_invariant7 ((temp___expr_256 Int)
  (temp___is_init_252 Bool) (temp___skip_constant_253 Bool)
  (temp___do_toplevel_254 Bool)
  (temp___do_typ_inv_255 Bool)) Bool (=>
                                     (or (= temp___is_init_252 true)
                                     (<= 0 last2)) (dynamic_property1 0 
                                     last2 temp___expr_256)))

;; last__def_axiom
  (assert (= last2 (max (length s1) (length s2))))

(declare-const lengths map1)

;; Assume
  (assert (dynamic_invariant2 s1 true false true true))

;; Assume
  (assert (dynamic_invariant2 s2 true false true true))

;; Assume
  (assert (dynamic_invariant2 s1 true false true true))

;; Assume
  (assert (dynamic_invariant2 s2 true false true true))

;; Assume
  (assert
  (and
  (and
  (and (dynamic_property6 first2 last3 (to_rep1 lengths__first)
  (to_rep1 lengths__last) first3 last4 (to_rep1 lengths__first_2)
  (to_rep1 lengths__last_2))
  (and (= (to_rep1 lengths__first) (first1 s1))
  (= (to_rep1 lengths__last) (last1 s1))))
  (and (= (to_rep1 lengths__first_2) (first1 s2))
  (= (to_rep1 lengths__last_2) (last1 s2))))
  (forall ((temp___368 Int) (temp___369 Int))
  (=>
  (and
  (and (<= (to_rep1 lengths__first) temp___368)
  (<= temp___368 (to_rep1 lengths__last)))
  (and (<= (to_rep1 lengths__first_2) temp___369)
  (<= temp___369 (to_rep1 lengths__last_2)))) (dynamic_property1 0 last2
  (to_rep2 (get lengths temp___368 temp___369)))))))

;; Assume
  (assert (dynamic_invariant x1 true false true true))

;; Assume
  (assert (dynamic_invariant1 x2 true false true true))

;; H
  (assert
  (= (and (ite (<= 0 x1) true false) (ite (<= x1 10) true false)) true))

;; H
  (assert
  (= (and (ite (<= 0 x2) true false) (ite (<= x2 10) true false)) true))

;; Assert
  (assert
  (and (<= (to_rep1 lengths__first_2) x2) (<= x2 (to_rep1 lengths__last_2))))

(assert
;; defqtvc
 ;; File "string_utilities.adb", line 20, characters 0-0
  (not (<= (to_rep1 lengths__first) x1)))
(check-sat)
